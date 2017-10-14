# frozen_string_literal: true

class User < ApplicationRecord
  enum frequency: { off: 0, low: 1, medium: 2, high: 3 }

  validates :provider, :uid, :username, :token, :secret, :profile_image, :frequency, presence: true
  validates :uid, uniqueness: { scope: :provider }
end
