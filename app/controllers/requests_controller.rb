class RequestsController < ApplicationController
  before_action :set_outfit, only: %i[new create]
  before_action :authenticate_user!

  def index
    @requests = current_user.requests
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.outfit = @outfit
    if @request.save
      redirect_to outfit_path(@request.outfit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @request = Request.find(params[:id])
    @request.outfit = Outfit.find(params[:outfit_id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    @request.save!
    redirect_to user_path(current_user)
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end

  def request_params
    params.require(:request).permit(:outfit_id, :status, :start_date, :end_date)
  end
end
