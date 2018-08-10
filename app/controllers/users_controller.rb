class UsersController < ApplicationController
  def dashboard
    @orders = current_user.wallet.orders.where(state: 'paid')
  end
end
