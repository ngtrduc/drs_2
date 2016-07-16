class DivisionsController < ApplicationController
  load_and_authorize_resource

  def show
    @profiles = @division.profiles
    @other_profiles = Profile.not_in @division.id
  end

  def update
    profiles = profile_params
    @division.load_old_profile profiles[:profile_ids]
    if @division.update_attributes profiles
      flash[:success] = t :add_success
    else
      flash[:danger] = t :add_fails
    end
    redirect_to @division
  end

  private
  def profile_params
    params.require(:division).permit profile_ids: []
  end
end
