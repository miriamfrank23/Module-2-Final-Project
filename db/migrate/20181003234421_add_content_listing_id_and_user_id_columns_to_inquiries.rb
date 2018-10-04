class AddContentListingIdAndUserIdColumnsToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :user_id, :integer
    add_column :inquiries, :listing_id, :integer
    add_column :inquiries, :content, :string
  end
end
