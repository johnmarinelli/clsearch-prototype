module QueryHelper
  def get_error_message(query, key)
    @query.nil? ? '' : @query.errors[key][0]
  end

  def retrieve_original_location_zipcode(zipcode)
    Reference::LocationReference.get_short_name_from_zipcode_code(zipcode) || zipcode
  end

  def retrieve_original_location_city(city)
    Reference::LocationReference.get_short_name_from_city_code(city) || city
  end

  def retrieve_original_location(location)
    if location.match(/^\d{5}$/).nil?
      retrieve_original_location_city location
    else
      retrieve_original_location_zipcode location
    end
  end
end