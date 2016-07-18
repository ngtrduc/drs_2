class Admin::ReportsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @durations = Report.durations
    @progesses = Progess.all
    @search = Report.includes(:user, :progess).search params[:q]
    @reports = @search.result.page params[:page]
    respond_to do |format|
      format.html
      format.csv
      format.xls {send_data @reports.to_csv(col_sep: "\t")}
    end
  end
end
