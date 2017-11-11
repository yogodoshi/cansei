source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use SCSS for stylesheets
gem 'autoprefixer-rails'
gem 'normalize-rails'
gem 'sass-rails', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Twitter authentication
gem 'omniauth', '~> 1.7.1'
gem 'omniauth-twitter', '~> 1.4.0'
# load environment variables from .env into ENV in development
gem 'dotenv-rails', '~> 2.2.1'

# allow easily app configuration through yaml files
gem 'config', '1.5.0'

# Integration with Twitter API
gem 'twitter', '~> 6.1.0'

group :production do
  # Use Puma as the app server
  gem 'puma', '~> 3.7'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
end

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.6.1'
  gem 'selenium-webdriver', '~> 3.6.0'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov', require: false
end
