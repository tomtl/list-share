class AddSlugColumns < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :lists, :slug, :string
    add_column :items, :slug, :string
  end
end
