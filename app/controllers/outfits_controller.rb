class OutfitsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @outfits = Outfit.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query"
      @outfits = @outfits.where(sql_subquery, query: "%#{params[:query]}%")
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
    params.require(:outfit).permit(:name, :description, :photo, :price)
  end
end
