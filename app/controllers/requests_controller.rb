class RequestsController < ApplicationController
  before_action :set_request, only: [:edit, :update, :destroy]

  def new
    @request = Request.new
    @design = Design.find(params[:design_id])
    @contribution = Contribution.new
  end

  def create
    @design = Design.find(params[:design_id])
    @request = Request.new(request_params)
    @request.design = @design
    @request.user = current_user
    @request.kind = 1;
    @contribution = Contribution.new(tokens: params[:contribution][:tokens].to_i)
    @contribution.user = current_user
    @contribution.request = @request
    if @request.save! && @contribution.save!
      redirect_to design_path(@design)
    else
      render 'new'
    end
  end

  def index
    @requests = Request.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:description, :file)
  end
end
