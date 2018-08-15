class DesignsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_design, only: [:show, :update, :edit, :destroy]

  def index
    @designs = policy_scope(Design).order(created_at: :desc)
    authorize @designs

    if params[:category].present?
      @designs = Design.joins(:category).where("categories.name ILIKE :category", category: params[:category])
    end

    if params[:designname].present?
      @designs = Design.where("name ILIKE ? OR description ILIKE ? ", "%#{params[:designname]}%", "%#{params[:designname]}%")
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

  def upvote
    @design = Design.find(params[:design_id])
    likes = @design.likes + 1
    @design.update(likes: likes)
    authorize @design
    respond_to do |format|
        format.html { redirect_to design_path(@design) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def create
   @attachment = Attachment.new(attachment_params)
   @category = Category.find_by(name: params[:design][:category])
   @design = Design.new(design_params)
   authorize @design
   @design.category = @category
   @request = Request.new(request_params)
   @request.user = current_user
   @request.kind = :original
   @contribution = Contribution.new(contribution_params)
   @contribution.user = current_user
   if @design.save!
      @attachment.design = @design
      @attachment.save!
      @request.design = @design
      if @request.save!
        @contribution.request = @request
        if @contribution.save!
          tokens = current_user.wallet.tokens - @contribution.tokens
          current_user.wallet.update(tokens: tokens)
          redirect_to @design
        else
          flash[:alert] = "Contribution invalid."
          render 'new'
        end
      else
        flash[:alert] = "Request did not save"
        render 'new'
      end
   else
    flash[:alert] = "Design did not save"
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

    redirect_to designs_path, notice: "The design has been deleted!"

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

  def contribution_params
    params.require(:contribution).permit(:tokens)
  end

  def request_params
    params.require(:request).permit(:description)
  end
end
