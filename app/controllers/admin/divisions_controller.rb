class Admin::DivisionsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @divisions = @divisions.page params[:page]
    @division = Division.new
  end

  def create
    if @division.save
      @divisions = Division.page params[:page]
      respond_to do |format|
        format.html {redirect_to admin_divisions_path}
        format.js
      end
    end
  end

  private
  def division_params
    params.require(:division).permit :name
  end
end
