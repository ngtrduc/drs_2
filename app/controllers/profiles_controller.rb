class ProfilesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def edit
    @profile = @user.profile
  end

  def update
    @profile = @user.profile
    if @profile.update_attributes profile_params
      flash[:success] = t :profile_updated
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit :name, :avatar
  end

  def correct_user
    @user = User.find_by_id params[:user_id]
    redirect_to root_path unless @user == current_user 
  end
end
