#! /bin/usr bash

# postgres
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install libpq-dev  

# gems
bundle install

# install devise
rails g devise:install

# install figaro
figaro install

# fill in application.yml

# create pg databases 'clsearch_prototype' and 'clsearch_prototype_test'

# migrate
rake db:migrate RAILS_ENV=development
rake db:migrate RAILS_ENV=test

# fill in zipcode and city references
rake api_reference:pull_zipcodes RAILS_ENV=development
rake api_reference:pull_zipcodes RAILS_ENV=test
rake api_reference:pull_cities RAILS_ENV=development
rake api_reference:pull_cities RAILS_ENV=test

# init whenever gem
wheneverize .
whenever --update-crontab
