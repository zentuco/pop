class OrdersController < ApplicationController

  def create
    order  = Order.create!(token_sku: params[:token_sku], amount: calculate, state: :pending, wallet: current_user.wallet)
    redirect_to new_order_payment_path(order)
  end

  private
  def calculate
    @tokens = params[:token_amount].to_i
    if @tokens >= 5000
      (@tokens/5)*0.7
    elsif @tokens >= 500
      (@tokens/5)*0.9
    elsif @tokens >= 50
      @tokens/5
    end
  end
end
