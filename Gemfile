source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgres as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Sass tools
gem 'bourbon', '~> 4.1.1'
gem 'neat', '~> 1.7.1'

# fix for IE8
gem 'selectivizr-rails'

# Font awesome
gem 'font-awesome-rails', '~> 4.3.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

group :development do
# Use Capistrano for deployment
gem 'capistrano-rails'
gem 'bullet'
end

gem 'refile', require: "refile/rails"
gem "refile-mini_magick"
gem "refile-s3"
gem 'sitemap_generator', '~> 5.0.5'
gem 'kaminari', '~> 0.16.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.1.0'
  gem 'bundler-audit'
  gem 'brakeman', :require => false
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'launchy', '~> 2.4.3'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end




