class UsersRelation < ActiveRecord::Base
  belongs_to :follower_user, class: User
  belongs_to :user

  validates :follower_user_id, presence: true
  validates :user_id, presence: true
end