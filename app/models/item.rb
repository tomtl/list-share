class Item < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: 'user_id'
  belongs_to :list
  belongs_to :completer, class_name: 'User', foreign_key: 'completed_by'
  
end