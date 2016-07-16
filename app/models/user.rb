class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable, :omniauthable
  has_one :profile, dependent: :destroy

  has_many :requests, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end

  # 1 is id of "manager" position
  def manager?
    1 == profile.position_id
  end

  class << self
    def from_omniauth auth
      user = User.find_or_initialize_by provider: auth.provider, uid: auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save
      user
    end
  end
end
