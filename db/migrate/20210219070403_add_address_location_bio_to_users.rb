class AddAddressLocationBioToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :location, :string
    add_column :users, :bio, :string
  end
end
