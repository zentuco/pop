class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:profile]
  def dashboard
    @orders = current_user.wallet.orders.where(state: 'paid')
    @contributions = current_user.contributions if current_user.contributions
    @projects = []
    current_user.contributions.each do |contribution|
      @projects << contribution.request.project if contribution.request.project
    end
  end

  def profile
    @user = current_user
  end

  def edit

  end

  def update_user_profile
    @user = current_user
    authorize @user
    @user.update(item_params)
    if @user.save
      redirect_to profile_path
    else
    render 'shared/modal_edit_profile'
    end
  end

  def item_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :photo)
  end

end
