class Division < ActiveRecord::Base
  has_many :profiles

  validates :name, length: {maximum: 50}, presence: true

  def load_old_profile params
    profiles.each do |profile|
      params << profile.id
    end
  end

  class << self
    def load_managers
      divisions = Division.all.includes :profiles
      list_manager = Hash.new
      divisions.each do |division|
        list_manager[division.id] = division.profiles.
          select{|profile| profile.position_id == 1}
      end
      list_manager
    end

    def send_mail_to_manager
      list_manager = load_managers
      list_manager.each do |division_id, managers|
        reports = Report.all_report_of division_id
        managers.each do |manager|
          UserMailer.reports_of_user_report(manager, reports).deliver_now
        end
      end
    end
  end

  private
end
