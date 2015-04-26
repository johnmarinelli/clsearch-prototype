namespace :api_reference do
  desc "Queries API's location.zipcode and stores results in database, indexed by short and full names"
  task pull_zipcodes: :environment do
    ZipcodeReference.delete_all
    reference = Search::APIReference.new 'locations', 'zipcode'
    zips = JSON.parse reference.search

    zips['locations'].each do |z|
      z.delete_if { |k, v| k.to_s.match(/bounds/) }
      zipcode_reference = ZipcodeReference.new z
      zipcode_reference.save
    end
  end

  desc "Queries API's location.city and stores results in database, indexed by short and full names"
  task pull_cities: :environment do
    CityReference.delete_all
    reference = Search::APIReference.new 'locations', 'city'
    cities = JSON.parse reference.search

    cities['locations'].each do |c|
      c.delete_if { |k, v| k.to_s.match(/bounds/) }
      city_reference = CityReference.new c
      city_reference.save
    end
  end

end
