class RemoveAvatarFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :avatar, :string
  end
end
