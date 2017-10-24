class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def index
    @likes = @post.likes
    render json: @likes
  end

  def create
    @like = @post.likes.build(like_params)
    @like.user = current_user
    if @like.save
      render json: @like, status: :created
    else
      render json: { errors: @like.errors.full_messages }, status: 422
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    head 204
  end

  private

  def like_params
    params.permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
