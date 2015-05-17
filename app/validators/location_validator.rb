class LocationValidator < ActiveModel::Validator
  def validate(record)
    location = record.location

    zip = location['zipcode']
    city = location['city']

    unless valid_location? zip, city
      record.errors[:location] << 'Location Validator bad city'
    end
  end

  private
  def valid_location?(zip, city)
    if zip.nil? or zip.empty?
      !(CityReference.find_city_by_code(city).nil?)
    elsif city.nil? or city.empty?
      !(ZipcodeReference.find_zipcode_by_code(zip).nil?)
    else
      false
    end
  end
end
