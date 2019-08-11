source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
#gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

#bootstrap導入
gem 'bootstrap', '~> 4.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  #rspec導入
  gem 'rspec-rails'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  #gem 'chromedriver-helper'

  #環境変数用gem 
  gem 'dotenv-rails'

  #ｴﾗｰを分かりやすくする↓
  gem 'better_errors'
  gem 'binding_of_caller'

  #rubocop導入
  gem 'rubocop', require: false

  #pry使用できるようにするため
  gem 'pry-rails'

  #ファクトリーボット
  gem 'factory_bot_rails', '~> 4.11'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :test do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#ｴﾗｰﾒｯｾｰｼﾞ日本語化
gem 'rails-i18n'

#検索機能
gem 'ransack'

#動画
gem 'streamio-ffmpeg'
gem 'mini_magick', '~> 4.8'

#ﾍﾟｰｼﾞﾈｰｼｮﾝ
gem 'kaminari', '~> 0.17.0'
gem 'kaminari-bootstrap', '~> 3.0.1'

 #google認証
 gem 'omniauth-google-oauth2'

#jquery
gem 'jquery-rails'

#1.画像を横スライドさせるgem
gem 'owlcarousel-rails'

#password_digest
gem 'bcrypt', '~> 3.1.7'

gem 'webdrivers'

#ActiveJob
gem 'sidekiq'