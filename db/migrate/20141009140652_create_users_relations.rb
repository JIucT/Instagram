class CreateUsersRelations < ActiveRecord::Migration
  def change
    create_table :users_relations do |t|
      t.integer :follower_user_id, null: false
      t.integer :user_id, null: false
    end
    add_index :users_relations, [:follower_user_id, :user_id], :unique => true
    add_index :users_relations, [:user_id, :follower_user_id], :unique => true
  end
end
