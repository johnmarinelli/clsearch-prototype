class CityReference < ActiveRecord::Base
  def self.find_city(name)
    CityReference.where("short_name = '#{name.to_s}'").first['code']
  end
end
