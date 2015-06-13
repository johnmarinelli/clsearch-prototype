def validate_location
  error = 'none'
  primary_location = params[:location_input].strip

  if primary_location.match(/^\d{5}$/).nil? 
    city = CityReference.find_city primary_location 
  else
    zipcode = ZipcodeReference.find_zipcode primary_location 
  end

  error = 'bbbad city' if city.nil? and zipcode.nil?
end
