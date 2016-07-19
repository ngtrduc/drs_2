class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :progess

  validates :progess_id, presence: true
  validates :report_date, presence: true
  validates :report_date, uniqueness: {scope: :user_id}
  validate :check_report_date
  scope :load_chart_info, -> date {where(report_date: date).group(:progess_id).size}
  scope :all_report_of, -> division_id{where("report_date == ? AND user_id IN
    (SELECT user_id FROM profiles WHERE division_id = ?)", Date.today, division_id)}

  enum duration: ["full_day", "half_day"]

  class << self
    def charts date
      chart = Report.load_chart_info date
      report_chart = Hash.new
      chart.each_key do |key|
        report_key = Progess.find_by_id(key).name
        report_chart[report_key] = chart[key]
      end
      report_chart
    end

    def to_csv options = {}
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |report|
          csv << report.attributes.values_at(*column_names)
        end
      end
    end
  end

  private
  def check_report_date
    errors.add :reports, I18n.t("reports.errors.no_future") if
      report_date && report_date > Date.today
  end
end
