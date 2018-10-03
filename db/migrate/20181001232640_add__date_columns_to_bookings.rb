class AddDateColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :check_in_date, :string
    add_column :bookings, :check_out_date, :string
  end
end
