# frozen_string_literal: true

class CreateUserFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :user_follows do |t|
      t.integer :following_id
      t.integer :follower_id

      t.timestamps
    end

    add_index :user_follows, :following_id
    add_index :user_follows, :follower_id
    add_index :user_follows, %i[following_id follower_id], unique: true
  end
end
