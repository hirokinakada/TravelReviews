class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :overview
      t.string :image_id
      t.string :address
      t.integer :tourist_id
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
