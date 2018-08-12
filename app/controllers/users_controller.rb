class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:profile]
  def dashboard
    @orders = current_user.wallet.orders.where(state: 'paid')
    @contributions = current_user.contributions if current_user.contributions
    @projects = []
    current_user.contributions.each do |contribution|
      @projects << contribution.request.project if contribution.request.project
    end
  end

  def profile
    @user = current_user
  end

end
