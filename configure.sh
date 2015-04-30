#! /bin/usr bash

# postgres
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install libpq-dev  

# gems
bundle install

# fill in application.yml

# create pg databases 'clsearch_prototype' and 'clsearch_prototype_test'

# fill in zipcode and city references
rake api_reference:pull_zipcodes
rake api_reference:pull_cities
