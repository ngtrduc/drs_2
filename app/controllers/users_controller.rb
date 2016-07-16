class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    @profile = @user.profile
    @active = if current_user.following? @user
      current_user.active_relationships.find_by followed_id: @user.id
    else
      current_user.active_relationships.build
    end
  end

  def index
    @users = User.page params[:page]
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
