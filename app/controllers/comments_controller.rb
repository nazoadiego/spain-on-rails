class CommentsController < ApplicationController
  before_action :set_company, only: %i[index edit create destroy]
  before_action :set_comment, only: %i[edit update destroy]
  before_action :skip_policy_scope, only: :index

  def index
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

  def edit
    authorize @comment
  end

  def update
    authorize @comment

    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to company_url(@comment.company), notice: "Comment was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Comment was successfully updated." }
      end
    else
      redirect_to company_url(@comment.company), status: :unprocessable_entity
    end
  end

  def destroy
    authorize @comment

    @comment.destroy

    redirect_to @company, notice: "Comment was successfully destroyed."
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :message, :parent_id)
  end
end
