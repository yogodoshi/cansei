# frozen_string_literal: true

class User < ApplicationRecord
  FREQUENCY_ENUM_DESCRIPTION = {
    'off' => 'Darei uma pausa nas reclamações',
    'low' => 'Estou insatisfeito, a empresa tem que melhorar! (twittaremos 1 vez por semana)',
    'medium' => 'Estou MUITO insatisfeito, já perdi várias horas da minha vida por causa deles! (twittaremos 1 vez por dia)',
    'high' => 'Estou DE SACO CHEIO do péssimo serviço dessa empresa! Já reclamei várias vezes com eles! (twittaremos 1 vez por hora)',
  }

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

  def self.frequency_options_for_select
    frequencies.map do |frequency, _|
      [FREQUENCY_ENUM_DESCRIPTION[frequency], frequency]
    end
  end
end
