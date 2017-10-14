# frozen_string_literal: true

class User < ApplicationRecord
  enum frequency: { off: 0, low: 1, medium: 2, high: 3 }

  validates :provider, :uid, :username, :token, :secret, :profile_image, :frequency, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      username: auth_hash.info.nickname,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
    user
  end
end
