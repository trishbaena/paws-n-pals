class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @outfits = @user.outfits
    @requests_received = Request.where(outfit: @user.outfits)
    @requests_made = Request.where(user: current_user)
  end
end
