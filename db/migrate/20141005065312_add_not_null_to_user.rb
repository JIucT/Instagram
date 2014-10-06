class AddNotNullToUser < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: false
    change_column :users, :firstname, :string, null: false
    change_column :users, :lastname, :string, null: false
    change_column :photos, :name, :string, null: false
  end
end
