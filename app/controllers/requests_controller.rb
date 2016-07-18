class RequestsController < ApplicationController
  load_and_authorize_resource

  before_action :load_request_type, only: [:new, :edit]

  def index
    if current_user.profile.manager?
      @statuses = Request.statuses
      load_request_type
      @search = Request.all_division(current_user.profile.division_id)
        .ransack params[:q]
      @requests = @search.result.includes(:user).page params[:page]
    else
      @requests = current_user.requests.page params[:page]
    end
  end

  def new
  end

  def create
  if @request.save
      flash[:success] = t :create_success
      redirect_to requests_path
    else
      load_request_type
      render :new
    end
  end

  def edit
  end

  def update
    if @request.update_attributes request_params
      flash[:notice] = t :update_success
      respond_to do |format|
        format.html {redirect_to requests_path}
        format.js
      end
    else
      load_request_type
      flash[:danger] = t :not_updated
      render :edit
    end
  end

  def destroy
    if @request.destroy
      flash[:notice] = t :delete_success
    else
      flash[:danger] = t :not_deleted
    end
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit :request_type, :leave_from, :leave_to,
      :compensation_time_from, :compensation_time_to, :reason, :status
  end

  def load_request_type
    @request_types = Request.request_types
  end
end
