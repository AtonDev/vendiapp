source 'https://rubygems.org'
ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

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


# Use Haml instead of erb
gem 'haml-rails', '~> 0.5.3'

#handles authetication for application
gem 'devise'

#encodes decodes html entities
gem 'htmlentities'


#For AWS image storage
gem 'paperclip'
gem 'aws-sdk'


#analytics
gem 'newrelic_rpm'

#pagination
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate'


#hash function for psw-digest
gem 'bcrypt-ruby', '~>3.1.2'

#Use bootstrap
gem 'bootstrap-sass'


#zip files
gem 'rubyzip'


#twilio integration
gem 'twilio-ruby'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
	#for debugging
	gem 'debugger'
	#annotates models and routes with attribute info
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'

  # for command line utilities
  gem 'thor'
end

group :production do
	#Sets assets in production
	gem 'rails_12factor'

  #multithreaded webserver
  gem 'unicorn'

end


#location position convertions gem
gem 'area'

# security update
gem 'psych', '~> 2.0.5'



gem 'delayed_job_active_record'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
