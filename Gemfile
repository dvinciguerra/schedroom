source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# ruby version
ruby '2.4.1'

# web & server
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'

# database & orm
gem 'pg', '~> 0.18'

# presenters & validators
gem 'active_model_serializers'

# auth & api token
gem 'jwt'
gem 'bcrypt'
gem 'knock'

# assets & media
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'sprockets-rails'
gem 'coffee-rails'
gem 'uglifier', '>= 1.3.0'

gem 'webpacker'
gem 'webpacker-react'

# deploy & ci
gem 'mina'


group :development, :test do
	gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
	gem 'faker'
	gem 'timecop'
	gem 'simplecov'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

	gem 'brakeman'
  gem 'rubocop'
	gem 'bullet'
end
