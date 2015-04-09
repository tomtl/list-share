class List < ActiveRecord::Base
  has_many :items
  has_many :list_users
  has_many :users, through: :list_users

  validates :name, presence: true
  
  def percent_complete(list)
    if list.items.size > 0
      total_items = list.items.size
      completed_items = list.items.select{ |item| !item.completed_by.nil? }.size 
      100 * completed_items / total_items
    else
      0
    end
  end
end
