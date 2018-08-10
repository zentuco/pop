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
    authorize @design
  end

  def create
    @design = Design.new(design_params)
    if @design.save!
      redirect_to @design
    else
      render 'new'
    end
    authorize @design
  end

  def edit
    authorize @design
  end

  def update
    @design.update(design_params)
    if @design.save!
      redirect_to @design
    else
      render 'edit'
    end
    authorize @design
  end

  def destroy
    @design.destroy
    authorize @design
  end

  private

  def set_design
    @design = Design.find(params[:id])
  end

  def design_params
    params.require(:design).permit(:name, :category, :description)
  end
end
