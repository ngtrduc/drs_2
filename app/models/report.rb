class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :progess

  validates :progess_id, presence: true
  validates :report_date, presence: true
  validates :report_date, uniqueness: {scope: :user_id}
  validate :check_report_date

  enum duration: ["full_day", "half_day"]

  private
  def check_report_date
    errors.add :reports, I18n.t("reports.errors.no_future") if
      report_date && report_date > Date.today
  end
end
