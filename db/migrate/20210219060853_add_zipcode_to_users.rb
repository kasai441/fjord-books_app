# frozen_string_literal: true

class AddZipcodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zipcode, :string
  end
end
