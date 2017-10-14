# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    provider 'twitter'
    sequence(:uid) { |n| "123Abc#{n}" }
    username 'yogodoshi'
    token '1234AbCd'
    secret '5678EfGh'
    profile_image 'https://pbs.twimg.com/profile_images/849013196325302277/KlcHE1l1_400x400.jpg'
    frequency 0

    trait :from_mocked_twitter_auth do
      provider 'twitter'
      uid 'bathjJwvdhKjgfgh8Jd745J7dh5Qkgflbnczd65dfnw'
      token '1234'
      secret '5678'
      username 'yogodoshi'
      profile_image 'https://pbs.twimg.com/profile_images/849013196325302277/KlcHE1l1_400x400.jpg'
    end
  end
end
