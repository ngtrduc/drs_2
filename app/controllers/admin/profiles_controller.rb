class Admin::ProfilesController < ApplicationController
  load_and_authorize_resource

  def update
    @profile = Profile.find_by_id params[:id]
    if @profile.update_attributes profile_params
      respond_to do |format|
        format.js
      end
    else
      redirect_to [:admin, @profile.user]
    end
  end

  private
  def profile_params
    params.require(:profile).permit :name, :avatar, :position_id,
      :division_id, :skill_id
  end
end
