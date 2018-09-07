class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    user.is_designer?
  end

  def create?
    user.admin? || user.is_designer?
  end

  def update?
    user.admin? || record.user == user && user.is_designer?
  end

  def destroy?
    user.admin?
  end
end
