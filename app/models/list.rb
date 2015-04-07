class List < ActiveRecord::Base
  has_many :items
  has_many :list_users
  has_many :users, through: :list_users

end
