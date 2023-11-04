class RequestsController < ApplicationController
  before_action :set_outfit, only: %i[new create]
  before_action :authenticate_user!

  def index
    # @requests = Request.all
    # @requests_by_user
    # @requests = Request.find(params[:current_user])
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
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
