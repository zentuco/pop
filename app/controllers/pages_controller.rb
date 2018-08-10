class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :designerlanding]

  def home
  end

  def deals
    @token = Token.new(amount: 0, sku: "token")
  end

  def designerlanding
  end
end
