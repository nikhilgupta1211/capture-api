class WelcomesController < ApplicationController

  def index
    render json: "Welcome to the Capture API."
  end

end
