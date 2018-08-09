class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
