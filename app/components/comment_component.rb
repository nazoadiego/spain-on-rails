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

  def replies
    @comment.replies
  end

  def show_reply_button?
    !@comment.is_a_reply?
  end

  def show_replies?
    @comment.has_replies?
  end

  def edit_frame_id
    dom_id(@comment, 'edit_frame')
  end

  def edit?
    Pundit.policy(@current_user, Comment).edit?
  end

  def delete?
    Pundit.policy(@current_user, Comment).destroy?
  end
end
