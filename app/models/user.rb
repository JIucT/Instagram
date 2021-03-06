class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos, dependent: :destroy
  has_many :users_relation, class: UsersRelation
  has_many :follower_users, class: User, through: :users_relation, foreign_key: :follower_user_id

  validates :email, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }
  validates :avatar, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.avatar ||= "noAvatar.jpg"
  end  
end
