class User < ActiveRecord::Base
  has_many :followers, through: :follower_follows, source: :follower
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

  has_many :followees, through: :followee_follows, source: :followee
  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"

  validates :first_name, :last_name, :email, :password_hash , presence:true
  validates :email, uniqueness: true
end
