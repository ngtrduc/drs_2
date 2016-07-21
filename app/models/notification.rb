class Notification < ActiveRecord::Base
  belongs_to :user

  enum noti_type: ["sending", "approved", "not_approve"]

  scope :unread, ->{where status: false}
  scope :order_by_time, ->{order created_at: :desc}

  class << self
    def create_for_managers division_id
      division = Division.find_by_id division_id
      managers = division.all_managers
      noti_params = []
      managers.each do |manager|
        noti_params << {user_id: manager.id, noti_type: "sending"}
      end
      Notification.create noti_params
    end

    def create_for_user user_id, status
      Notification.create user_id: user_id, noti_type: status
    end
  end
end
