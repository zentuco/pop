class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @contributors = []
    @project.request.contributions.each do |contribution|
      @contributors << contribution.user
    end
    authorize @project
  end

  def create
    @request = Request.find(params[:request].to_i)
    @project = Project.new(accepted_price: @request.total_tokens)
    @project.designer = current_user.designer
    @project.request = @request
    authorize @project
    if @project.save!
      redirect_to dashboard_path
    else
      render 'designs#show'
    end
  end

  def update
    authorize @project
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to dashboard_path
  end
end
