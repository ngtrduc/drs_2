class Division < ActiveRecord::Base
  has_many :profiles

  validates :name, length: {maximum: 50}, presence: true

  def load_old_profile params
    profiles.each do |profile|
      params << profile.id
    end
  end
end
