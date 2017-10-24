class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: 422
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    head 204
  end

  private

  def comment_params
    params.permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
