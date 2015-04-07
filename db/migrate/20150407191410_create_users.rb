class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :timezone
      t.timestamps
    end
  end
end
