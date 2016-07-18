class Admin::ChartsController < Admin::BaseController
  authorize_resource :request, class: Request.name
  authorize_resource :report, class: Report.name

  def index
    @request_charts = Request.charts
    @report_charts = Report.charts params[:date] ? params[:date] : Date.today
  end
end
