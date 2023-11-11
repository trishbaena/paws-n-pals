class OutfitsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:category]
      @category = Category.find_by(name: params[:category])
      @outfits = @category ? @category.outfits : Outfit.none
    else
      @outfits = Outfit.all
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
    @requests = @outfit.requests
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user
    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to user_path(current_user)
  end

  private

  def outfit_params
    params.require(:outfit).permit(:name, :description, :photo, :price, :category_id)
  end
end
