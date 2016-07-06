class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @users = @users.paginate(page: params[:page]).per_page Settings.page_size
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
