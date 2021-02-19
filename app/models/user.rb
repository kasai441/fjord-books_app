# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar

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
end
