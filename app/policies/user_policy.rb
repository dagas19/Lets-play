class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def me?
    true
  end

  def update?
    user == record
  end

  def show?
    true
  end
end
