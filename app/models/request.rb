class Request < ActiveRecord::Base
  belongs_to :user

  validates :request_type, presence: true
  validates :reason, presence: true, length: {maximum: 50}
  validates :leave_to, presence: true
  validates :leave_from, presence: true
  validate :check_time
  validate :check_compensation_time

  enum request_type: ["il", "lo", "le"]
  enum status: ["waiting", "approved", "not_approve"]

  scope :all_division, -> manager_division_id {where "user_id IN
    (SELECT user_id FROM profiles WHERE division_id = ?)", manager_division_id}
  scope :charts, ->{group("date(created_at)").size}
  scope :order_by_status, ->{order status: :asc}

  private
  def check_time
    unless leave_from.nil? && leave_to.nil?
      errors.add :requests, I18n.t(:time_fails) if leave_from > leave_to
    end
  end

  def check_compensation_time
    unless compensation_time_from.nil? && compensation_time_to.nil?
      if compensation_time_from > compensation_time_to && compensation_time_from > leave_to
        errors.add :requests, I18n.t(:time_fails)
      end
    end
  end
end
