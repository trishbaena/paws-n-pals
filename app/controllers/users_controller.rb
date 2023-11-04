class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @outfits = @user.outfits
    #made to user. thing, model.where(category, thing). returns array.
    @requests_received = Request.where(outfit: @user.outfits)
    #made by user
    @requests_made = @user.requests
  end
end
