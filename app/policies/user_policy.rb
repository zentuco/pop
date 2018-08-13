class UserPolicy < ApplicationPolicy
  def update_user_profile?
    user == record
  end

end
