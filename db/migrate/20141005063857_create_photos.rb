class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
