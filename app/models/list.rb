class List < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :items
  has_many :list_users
  has_many :users, through: :list_users
  
end