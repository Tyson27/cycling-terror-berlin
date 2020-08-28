class User < ApplicationRecord
  has_many :problems
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# devise is pre-setup authenfication, table database where you can add stuff and validates email password.
#   if you need extra attributes to user "in the log in field", it needs to be done in a particular way. Check with TA Tony.
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
#   validates :email, presence: true -> done by devise
#   validates :password, presence: true -> done by devise
  acts_as_favoritor
end
