class CityReference < ActiveRecord::Base
  def self.find_city(name)
    CityReference.where("short_name = '#{name.to_s}'").first['code']
  end

  def self.find_city_by_code(code)
    city = CityReference.where("code = '#{code.to_s}'").first
    city.nil? ? code : city['short_name']
  end
end
