class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.integer :user_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
