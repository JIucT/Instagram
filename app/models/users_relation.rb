class UsersRelation < ActiveRecord::Base
  belongs_to :follower, class: User
  belongs_to :user

  validates :follower_user_id, presence: true
  validates :user_id, presence: true
end