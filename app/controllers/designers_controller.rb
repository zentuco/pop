class DesignersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @designer = Designer.new
  end

  def create
    byebug
    if user_signed_in?
      @user = current_user
    else
      @user = User.create(user_params)
    end
    @designer = Designer.new(designer_params)
    @designer.user = @user
    if @designer.save!
      redirect_to root_path #will change to requests#index when view is created
    else
      render 'new'
    end
  end

  def index
    @designers = Designer.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def designer_params
    params.require(:designer).permit(:description, :experience, :website, :linkdin, :thingiverse_username)
  end
end
