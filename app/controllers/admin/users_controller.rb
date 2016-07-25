class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @search = User.includes(:profile).search params[:q]
    @users = @search.result.page params[:page]
  end

  def show
    @profile = @user.profile
    get_data
  end

  def destroy
    @user.destroy
    flash[:success] = t :destroy_success
    redirect_to admin_users_path
  end

  private
  def get_data
    [Position, Division, Skill].each do |model|
      instance_variable_set "@#{model.table_name}", model.all
    end
  end
end
