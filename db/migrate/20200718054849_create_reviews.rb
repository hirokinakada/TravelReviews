class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    t.integer :customer_id
    t.integer :spot_id
    t.string :title
    t.string :body
    t.string :image_id
    t.float :rate
      t.timestamps
    end
  end
end
