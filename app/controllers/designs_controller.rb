class DesignsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_design, only: [:show, :update, :edit, :destroy]

  def index
    @designs = Design.all
  end

  def show
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    if @design.save!
      redirect_to @design
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @design.update(design_params)
    if @design.save!
      redirect_to @design
    else
      render 'edit'
    end
  end

  def destroy
    @design.destroy
  end

  private

  def set_design
    @design = Design.find(params[:id])
  end

  def design_params
    params.require(:design).permit(:name, :category, :description)
  end
end
