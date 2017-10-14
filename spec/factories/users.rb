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
  end
end
