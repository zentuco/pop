class DesignerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    user.admin?
  end

  def create?
    true
  end

  def new?
    create?
  end
end
