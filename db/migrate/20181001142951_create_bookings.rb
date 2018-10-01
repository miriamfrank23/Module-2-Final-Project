class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :matched_user, index: true

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :matched_user_id
    add_index :bookings, [:user_id, :matched_user_id], unique: true
  end
end
