def validate_input(params)
  errors = []

  # location
  primary_location = params[:location_primary].strip

  if primary_location.match(/^\d{5}$/).nil? 
    city = CityReference.find_city primary_location 
    errors << 'bad city' if city.nil?
  else
    zipcode = ZipcodeReference.find_zipcode primary_location 
    errors << 'bad zip' if zipcode.nil?
  end

  errors.empty? ? nil : errors
end

