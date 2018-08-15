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
    authorize @project
  end

  def update
    authorize @project
  end

  def destroy
    authorize @project
  end
end
