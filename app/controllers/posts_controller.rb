class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @posts = user_posts if params[:email]
    render json: @posts
  end

  def create
    @post = Post.create(post_params)
    @post.user  = current_user  
    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  def show
    @post = Post.where(id: params[:id])
    if !@post.empty?
      render json: @post
    else
      render json: { errors: "Post not found" }, status: :not_found
    end
  end

  def destroy
    @post = Post.where(id: params[:id])
    if !@post.empty?
      @post.first.destroy
      render json: "Post Deleted"
    else
      render json: { errors: "Post not found" }, status: :not_found
    end
  end

  def user_posts
    user = User.find_by(email: params[:email])
    user.posts if user
  end

  private

  def post_params
    params.permit(:photo, :title, :description)
  end

end
