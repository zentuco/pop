class DesignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def upvote?
    user
  end

  def update?
    user && user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user && user.admin?
  end
end
