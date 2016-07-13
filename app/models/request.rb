class Request < ActiveRecord::Base
  belongs_to :user

  validates :request_type, presence: true
  validates :reason, presence: true, length: {maximum: 50}
  validates :leave_to, presence: true
  validates :leave_from, presence: true
  validate :check_time
  validate :check_compensation_time

  enum type: ["il", "lo", "le"]

  private
  def check_time
    errors.add :requests, I18n.t(:time_fails) if leave_from > leave_to
  end

  def check_compensation_time
    if compensation_time_from > compensation_time_to && compensation_time_from > leave_to
      errors.add :requests, I18n.t(:time_fails)
    end
  end
end
