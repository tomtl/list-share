class User < ActiveRecord::Base
  has_many :items
  has_many :list_users
  has_many :lists, through: :list_users

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}, on: :create

  has_secure_password validations: false

end
