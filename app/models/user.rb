class User < ActiveRecord::Base
  has_many :lists
  has_many :items
  has_many :list_users
  has_many :lists, through: :list_users
  
end