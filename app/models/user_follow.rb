# frozen_string_literal: true

class UserFollow < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'
  validates :following_id, presence: true
  validates :follower_id, presence: true
  validates :following_id, uniqueness: { scope: :follower_id }
end
