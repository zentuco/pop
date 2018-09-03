class DesignersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @designer = Designer.new
  end

  def create
  end
end
