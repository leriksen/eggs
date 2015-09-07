# A sample Gemfile
source "https://rubygems.org"

ruby '2.1.6'

gem "rails"
gem 'rake'
gem 'pg'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'haml-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'bootstrap-sass'
gem 'bootstrap_form'
gem 'bootstrap-generators'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'rspec'
  gem 'cucumber'
  gem 'factory_girl'
  gem 'capybara'
end

group :development do
  gem 'pry-state'
  gem 'pry-nav'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard'
  gem 'guard-rspec'
  gem 'ruby_gntp'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end

platforms :ruby do # linux
  gem 'unicorn'
end

platforms :x64_mingw do # gems specific to windows
  gem 'thin'
end
