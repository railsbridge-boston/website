source "https://rubygems.org"

ruby "2.3.1"

gem "airbrake"
gem "autoprefixer-rails"
gem "bourbon", "~> 4.2.0"
gem "flutie"
gem "high_voltage"
gem "httparty"
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "normalize-rails", "~> 3.0.0"
gem "rack-contrib"
gem "rails", "~> 4.2.11"
gem "rake", "< 12.0"
gem "refills"
gem "sass-rails", "~> 5.0"
gem "uglifier"
gem "unicorn"

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit"
  gem "byebug"
  gem "dotenv-rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.1.0"
end

group :test do
  gem "capybara"
  gem "climate_control"
  gem "launchy"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
  gem "rails_stdout_logging"
end
