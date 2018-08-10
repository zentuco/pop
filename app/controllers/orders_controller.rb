class OrdersController < ApplicationController

  def create
    order  = Order.create!(token_sku: params[:token_sku], amount: params[:token_amount].to_i, state: :pending, wallet: current_user.wallet)
    byebug
    redirect_to new_order_payment_path(order)
  end
end
