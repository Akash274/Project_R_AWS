class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.integer :photo_id
      t.string :file_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
