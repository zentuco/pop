class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.admin? || user.designer?
  end

  def update?
    user.admin? || user.designer?
  end

  def destroy?
    user.admin?
  end
end
