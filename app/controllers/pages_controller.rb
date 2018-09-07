class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :designerlanding]

  def home
    @designs = Design.trending
  end

  def deals
    session[:topup_redirect] = request.referrer
  end

  def designerlanding
    @user = current_user
  end
end
