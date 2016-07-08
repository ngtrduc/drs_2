class Division < ActiveRecord::Base
  has_many :profiles

  validates :name, length: {maximum: 50}, presence: true
end
