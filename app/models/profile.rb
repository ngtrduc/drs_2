class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  belongs_to :position
  belongs_to :division

  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"},
    default_url: "avatar/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment :avatar,
    content_type: {content_type: ["image/jpeg", "image/jpg", "image/png", "image/gif"]},
    size: {in: 0..2048.kilobytes}
  validates :name, length: {maximum: 50}

  scope :all_manager, -> {where("position_id IN (select id from positions where
    positions.name = ?)", "Manager")}
  scope :not_in, -> division_id {where("division_id NOT IN (select id from divisions
    where divisions.id == #{division_id})") + where(division_id: nil)}
end
