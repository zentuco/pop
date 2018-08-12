class DesignsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_design, only: [:show, :update, :edit, :destroy]

  def index
    @designs = policy_scope(Design).order(created_at: :desc)
    authorize @designs

    if params[:designname].present?
      @designs = Design.where("name ILIKE ? OR description ILIKE ? ", "%#{params[:designname]}%", "%#{params[:designname]}%")
    else
      @designs = Design.all
    end
  end

  def show
    @contribution = Contribution.new
    authorize @design
  end

  def new
   @design = Design.new
   @attachment = Attachment.new
   authorize @design
 end

  def create
   @attachment = Attachment.new(attachment_params)
   @category = Category.find_by(name: params[:design][:category])
   @design = Design.new(design_params)
   @design.category = @category
   @attachment.design = @design

   authorize @design
   if @design.save! && @attachment.save!
     redirect_to @design
   else
     render 'new'
   end
 end

  def edit
    authorize @design
  end

  def update
    @design.update(design_params)
    authorize @design
    if @design.save!
      redirect_to @design
    else
      render 'edit'
    end
  end

  def destroy
    authorize @design
    @design.destroy

  end

  private

  def set_design
    @design = Design.find(params[:id])
  end

  def design_params
    params.require(:design).permit(:name, :description)
  end

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
