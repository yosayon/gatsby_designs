class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :comment
      t.integer :user_id
      t.integer :product_id
      t.integer :product_rating
      t.timestamps
    end
  end
end
