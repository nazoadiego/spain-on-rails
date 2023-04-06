class CommentsController < ApplicationController
  before_action :set_company, only: %i[create destroy]

  def index
    policy_scope(Comment)

    redirect_to @company
  end


  def create
    @comment = @company.comments.new(comment_params) do |comment|
      comment.user = current_user
    end

    authorize @comment

    if current_user.nil?
      flash[:notice] = 'You need to sign in to comment!'
      redirect_to @company and return
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

  def set_company
    @company = Company.find(params[:company_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :message)
  end
end
