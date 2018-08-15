class UserPolicy < ApplicationPolicy
  def update_user_profile?
    user == record
  end

  def destroy?
    true
  end

  def show?
    true
  end
end
