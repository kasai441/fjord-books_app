# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_many :user_follows, inverse_of: :follower, foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :user_follows
  has_many :reverse_user_follows, inverse_of: :following, foreign_key: 'following_id',
                                  class_name: 'UserFollow',
                                  dependent: :destroy
  has_many :followers, through: :reverse_user_follows

  validates :email, presence: true, uniqueness: true
  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def following?(other_user)
    user_follows.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    user_follows.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    user_follows.find_by(following_id: other_user.id).destroy
  end
end
