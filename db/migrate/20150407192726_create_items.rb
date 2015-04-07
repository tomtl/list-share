class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :user_id
      t.integer :list_id
      t.integer :completed_by
      t.timestamps
    end
  end
end
