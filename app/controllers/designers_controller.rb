class DesignersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    redirect_to root_path if current_user.is_designer
    @designer = Designer.new
  end

  def create
    if user_signed_in?
      @user = current_user
    else
      @user = User.create(user_params)
    end
    @designer = Designer.new(designer_params)
    @designer.user = @user
    if @designer.save!
      #render flash[:notice] = "Application submitted" # need to make a better alert
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @designers = Designer.all
  end

  def approve
    @user = Designer.find(params[:designer].to_i).user
    @user.update(is_designer: true)
    redirect_to designers_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def designer_params
    params.require(:designer).permit(:description, :experience, :website, :linkdin, :thingiverse_username)
  end
end
