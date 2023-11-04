class RequestsController < ApplicationController
before_action :authenticate_user!
before_action :set_outfit, only: %i[new create]
before_action :set_request, only: %i[accept reject]

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
end

def accept
  if @request.update(status: 'Accepted')
    redirect_to outfit_requests_path(@request.outfit), notice: 'Request accepted.'
  else
    redirect_to outfit_requests_path(@request.outfit), alert: 'Unable to accept request.'
  end
end

def reject
  if @request.destroy
    redirect_to outfit_requests_path(@request.outfit), notice: 'Request rejected.'
  else
    redirect_to outfit_requests_path(@request.outfit), alert: 'Unable to reject request.'
  end
end

private

def set_request
  @request = Request.find(params[:id])
end

def set_outfit
  @outfit = Outfit.find(params[:outfit_id])
end

def request_params
  params.require(:request).permit(:start_date, :end_date)
end
end
