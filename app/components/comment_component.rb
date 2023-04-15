# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  def initialize(comment:, current_user:)
    @comment = comment
    @current_user = current_user
  end

  def title
    @comment.title
  end

  def author
    @comment.user.email
  end

  def message
    @comment.message
  end

  def edit?
    Pundit.policy(@current_user, Comment).edit?
  end

  def delete?
    Pundit.policy(@current_user, Comment).destroy?
  end
end
