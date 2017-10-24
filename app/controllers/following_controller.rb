class FollowingController < ApplicationController
  before_action :authenticate_user!

  def index
    @following_users = current_user.following
    if !@following_users.empty?
      render json: @following_users
    else
      render status: :not_found
    end
  end
end
