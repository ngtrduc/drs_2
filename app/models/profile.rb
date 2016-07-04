class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  belongs_to :position
  belongs_to :division
end
