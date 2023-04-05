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
    # is the comment mine? OR I am an admin and love censorship
  end

  def update?
    # is the comment mine? OR I am an admin and love censorship
  end

  def destroy?
    # To be implemented, dont remember if we have access to current user here
    # I would hope so, no?
    current_user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
