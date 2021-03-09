# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  def self.find_for_github_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.nickname
    end
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.github_data']) && session['devise.github_data']['info'] && user.email.blank?
        user.email = data['email']
      end
    end
  end
end
