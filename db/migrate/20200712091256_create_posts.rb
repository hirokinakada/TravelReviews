class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :topic_id
      t.integer :customer_id
      t.string :name
      t.string :body
      t.timestamps
    end
  end
end
