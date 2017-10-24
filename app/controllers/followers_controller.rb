class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @followers = current_user.followers
    if !@followers.empty?
      render json: @followers
    else
      render json: { errors: "No Followers Found" }, status: :not_found
    end
  end
end
