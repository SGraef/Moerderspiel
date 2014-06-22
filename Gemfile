source 'https://rubygems.org'

gem 'haml'
gem 'haml-rails'
gem "therubyracer", '~> 0.11'
gem "twitter-bootstrap-rails", '~> 2.2'
gem 'less-rails'
gem 'sorcery'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem "pry-rails"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# using d3 javascript for drawing the graphs
gem 'd3_rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'quiet_assets'
  # Datenbanktreiber
  gem 'sqlite3'
  
  # Rack-Server
  # gem 'unicorn', '~> 4.5.0'

  # bequeme Fehleranzeige
  gem "better_errors"
  gem "binding_of_caller"
  
  # Javascript Runtime
  # gem 'therubyracer', '~> 0.11'

  # Geschwindigkeits/Bottleneck-Tests
  # gem 'rack-mini-profiler'

  # Automatisierung von allerhand Developer-Aufgaben
  gem 'guard', '~> 1.6'
  
  # Guard spezifische gems
  if RUBY_PLATFORM =~ /darwin/
    gem 'rb-fsevent', :require => false
    # gem 'ruby_gntp'
    gem 'growl'
  end

  gem 'guard-cucumber', '~> 1.3'
  gem 'guard-bundler', '~> 1.0'
  gem 'guard-migrate', '~> 0.1'
  gem 'guard-rspec', '~> 2.4'

  # To use debugger
  # gem 'debugger'
end
group :test do
  # Feature-Verfahren für Akzeptanztests
  gem 'cucumber-rails', '~> 1.4', :require => false

  # Testen von Views (HTML und Javascript)
  gem 'capybara', '~> 2.0'

  # Datenbank nach Tests aufräumen
  gem 'database_cleaner'
  
  gem 'launchy'
  # Testinstancen
  gem 'factory_girl_rails'
end

group :development, :test do
  # bequemere Unit-Tests und Expectations
  gem 'rspec-rails', '~> 2.12'
end
group :production do
  gem 'mysql2', '~> 0.3.11'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
