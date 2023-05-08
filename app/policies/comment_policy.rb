class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    user_is_the_owner_or_admin?
  end

  def update?
    user_is_the_owner_or_admin?
  end

  def destroy?
    user.admin?
  end

  private

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
