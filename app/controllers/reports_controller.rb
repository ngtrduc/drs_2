class ReportsController < ApplicationController
  load_and_authorize_resource
  before_action :load_data_for_select, only: [:new, :edit]

  def index
    @reports = @reports.page params[:page]
  end

  def new
  end

  def create
    @report.user_id = current_user.id
    if @report.save
      flash[:success] = t :create_success
      redirect_to reports_path
    else
      load_data_for_select
      flash[:danger] = t :not_created
      render :new
    end
  end

  def edit
  end

  def update
    if @report.update_attributes report_params
      flash[:notice] = t :update_success
      redirect_to reports_path
    else
      load_data_for_select
      flash[:danger] = t :not_updated
      render :edit
    end
  end

  def destroy
    if @report.destroy
      flash[:notice] = t :delete_success
    else
      flash[:danger] = t :not_deleted
    end
    redirect_to reports_path
  end

  private
  def report_params
    params.require(:report).permit :progess_id, :duration,
      :achievement, :report_date
  end

  def load_data_for_select
    @durations = Report.durations
    @progesses = Progess.all
  end
end
