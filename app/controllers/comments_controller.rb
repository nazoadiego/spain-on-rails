class CommentsController < ApplicationController
  before_action :set_company, only: %i[create destroy]

  def create
    @comment = @company.comments.new(comment_params) do |comment|
      comment.user = current_user
    end

    if @comment.save
      redirect_to @company,  status: :created, notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: "Could not create comment."
    end
  end

  def destroy
    @comment.destroy

    redirect_to @company, notice: "Comment was successfully destroyed."
  end

  def set_idea
    @company = Company.find(params[:company_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :message)
  end
end
