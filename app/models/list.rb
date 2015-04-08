class List < ActiveRecord::Base
  has_many :items
  has_many :list_users
  has_many :users, through: :list_users

  validates :name, presence: true
end
