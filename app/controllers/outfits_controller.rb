class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.all
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def new
    @outfit = Outfit.new
    @user = User.find(params[:user_id])
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = @user
    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def outfit_params
    params.require(:outfit).permit(:name, :description, :photo_url, :price)
  end
end
