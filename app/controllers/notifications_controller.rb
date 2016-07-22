class NotificationsController < ApplicationController
  load_and_authorize_resource

  def index
    @notifications = @notifications.order_by_time.page params[:page]
    @notifications.each do |notification|
      notification.update_attributes status: true
    end
  end
end
