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

  def show
    @search = @division.profiles.ransack params[:q]
    @profiles = @search.result.page params[:page]
    @managers = Profile.all_manager
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @division.update_attributes division_params
    @divisions = Division.page params[:page]
    respond_to do |format|
      format.html {redirect_to admin_division_path @division}
      format.js
    end
  end

  def destroy
    @division.destroy
    @divisions = Division.page params[:page]
    respond_to do |format|
      format.html {redirect_to admin_divisions_path}
      format.js
    end
  end

  private
  def division_params
    params.require(:division).permit :name
  end
end
