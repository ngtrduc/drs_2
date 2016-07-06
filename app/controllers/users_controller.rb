class UsersController < ApplicationController
  before_action :find_user, only: :show
  def show
    @profile = @user.profile
  end
  
  def index
    @users = User.paginate page:params[:page]
  end

  private
  def find_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      redirect_to root_path
      flash[:danger] = t :user_fails
    end
  end
end
