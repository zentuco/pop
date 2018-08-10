class ContributionsController < ApplicationController

  def create
    @request = Request.find(params[:contribution][:request].to_i)
    @contribution = Contribution.new(contribution_params)
    @contribution.request = @request
    @contribution.user = current_user
    if @contribution.save!
      redirect_to dashboard_path
    else
      redirect_to design_path(@request.design)
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:tokens)
  end
end
