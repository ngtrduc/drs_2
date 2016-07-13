class RequestsController < ApplicationController
  load_and_authorize_resource

  def new
    request_types = Request.request_types
  end

  def create
  if @request.save
      flash[:success] = t :create_success
      redirect_to requests_path
    else
      request_types = Request.request_types
      render :new
    end
  end

  private
  def request_params
    params.require(:request).permit :request_type, :leave_from, :leave_to,
      :compensation_time_from, :compensation_time_to, :reason
  end
end
