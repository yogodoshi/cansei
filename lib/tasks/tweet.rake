# frozen_string_literal: true

desc 'Tweet from the users that choose to do it weekly'
task tweet_weekly_to_the_company: :environment do
  if Time.current.wday == 1 # Check if its monday as heroku scheduler doesnt have "weekly frequency"
    User.low.find_each do |user|
      TwitterService.new(user).tweet_a_complaint
    end
  end
end

desc 'Tweet from the users that choose to do it daily'
task tweet_daily_to_the_company: :environment do
  User.medium.find_each do |user|
    TwitterService.new(user).tweet_a_complaint
  end
end

desc 'Tweet from the users that choose to do it hourly'
task tweet_hourly_to_the_company: :environment do
  User.high.find_each do |user|
    TwitterService.new(user).tweet_a_complaint
  end
end
