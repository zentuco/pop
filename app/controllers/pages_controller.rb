class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :designerlanding]

  def home
  end

  def deals
  end

  def designerlanding
    @user = current_user
  end
end
