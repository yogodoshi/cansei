desc 'Tweet to the company from each User'
task tweet_to_the_company: :environment do
  User.where.not(frequency: 'off').find_each do |user|
    TwitterService.new(user).tweet_to_the_company
  end
end
