class UsersController < ApplicationController
  def dashboard
    @orders = current_user.wallet.orders.where(state: 'paid')
    @contributions = current_user.contributions
    @projects = []
    current_user.contributions.each do |contribution|
      @projects << contribution.request.project if contribution.request.project
    end
  end
end
