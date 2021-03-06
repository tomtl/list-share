class User < ActiveRecord::Base
  include Sluggable
  
  has_many :items
  has_many :list_users
  has_many :lists, through: :list_users
  
  sluggable_column :username

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}, on: :create

  has_secure_password validations: false

  def to_do_items
    self.items.select{ |item| item.completed_by.nil? }
  end
  
  def completed_items
    self.items.select{ |item| !item.completed_by.nil? }
  end

end
