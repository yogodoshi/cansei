# frozen_string_literal: true

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  provider: 'twitter',
  uid: 'bathjJwvdhKjgfgh8Jd745J7dh5Qkgflbnczd65dfnw',
  info: {
    nickname: 'yogodoshi',
    image: 'https://pbs.twimg.com/profile_images/849013196325302277/KlcHE1l1_400x400.jpg',
  },
  credentials: {
    token: '1234',
    secret: '5678',
    expires_at: '1355082790',
    expires: 'true'
  },
  extra: {
    account_creation_date: '2008-04-21',
    account_type: 'PERSONAL',
    address: {
      country: 'US',
      locality: 'San Jose',
      postal_code: '95131',
      region: 'CA',
      street_address: '1 Main St'
    },
    language: 'en_US',
    locale: 'en_US',
    verified_account: 'true',
    zoneinfo: 'America/Los_Angeles',
    age_range: '31-35',
    birthday: '1982-01-01'
  }
})
