class AddAddressColumnToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :address, :string
  end
end
