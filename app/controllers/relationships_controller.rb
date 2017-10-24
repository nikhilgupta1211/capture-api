class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    render status: :created
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    render status: 200
  end
end
