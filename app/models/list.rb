class List < ActiveRecord::Base
  include Sluggable
  
  has_many :items
  has_many :list_users
  has_many :users, through: :list_users
  
  sluggable_column :name

  validates :name, presence: true

  def percent_complete
    if self.items.size > 0
      total_items = self.items.size
      completed_items = self.items.select{ |item| !item.completed_by.nil? }.size 
      100 * completed_items / total_items
    else
      0
    end
  end
end
