class LocationValidator < ActiveModel::Validator
  def validate(record)
    location = record.location

    return false if location.nil?

    zip = location['zipcode']
    city = location['city']

    unless valid_location? zip, city
      record.errors[:location] << "Sorry, we couldn\'t find that city! \
                                   Please try spelling the whole name out."
    end
  end

  private
  def valid_location?(zip, city)
    # location can be empty
    if zip.nil? and city.nil?
      true
    # if location isn't empty, check if it's a city
    elsif zip.nil? or zip.empty?
      !(CityReference.find_city_by_code(city).nil?)
    # if it's not a city, check if it's a zipcode
    elsif city.nil? or city.empty?
      !(ZipcodeReference.find_zipcode_by_code(zip).nil?)
    end
  end
end
