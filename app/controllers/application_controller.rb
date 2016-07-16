class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protect_from_forgery with: :exception
  before_action :authenticate_user!, :notification_count

  def after_sign_in_path_for resource
    current_user.try(:is_admin?) ? admin_root_path : root_path
  end

  private
  def current_ability
    namespace = controller_path.split("/").first
    Ability.new current_user, namespace
  end

  def notification_count
    @noti_count = current_user.unread_noti.size if user_signed_in?
  end
end
