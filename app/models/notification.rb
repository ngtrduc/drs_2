class Notification < ActiveRecord::Base
  belongs_to :user

  enum noti_type: ["sending", "approving", "not_apporve"]

  scope :unread, ->{where status: false}

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

    def create_for_users division_id, request_type
      division = Division.find_by_id division_id
      users = division.all_users
      noti_type = request_type == "approved" ? "approving" : "not_apporve"
      noti_params = []
      users.each do |user|
        noti_params << {user_id: manager.id, noti_type: noti_type}
      end
      Notification.create noti_params
    end
  end
end
