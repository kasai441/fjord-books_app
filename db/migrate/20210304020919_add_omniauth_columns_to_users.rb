# frozen_string_literal: true

class AddOmniauthColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_index :users, %i[uid provider], unique: true
  end
end
