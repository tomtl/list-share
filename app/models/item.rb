class Item < ActiveRecord::Base
  include Sluggable
  
  belongs_to :creator, class_name: "User", foreign_key: 'user_id'
  belongs_to :list
  belongs_to :completer, class_name: 'User', foreign_key: 'completed_by'
  
  sluggable_column :name
  
end