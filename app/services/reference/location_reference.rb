module Reference
  class LocationReference
    def self.get_short_name_from_zipcode_code(code)
      zipcode = ZipcodeReference.where('code=?', code).first
      zipcode.short_name unless zipcode.nil?
    end

    def self.get_short_name_from_city_code(code)
      city = CityReference.where('code=?', code).first
      city.short_name unless city.nil?
    end

    def self.validate_location(primary_location)
      error = 'none'

      if !primary_location.empty?
        if primary_location.match(/^\d{5}$/).nil? 
          city = CityReference.find_city primary_location 
        else
          zipcode = ZipcodeReference.find_zipcode primary_location 
        end

        error = 'We couldn\'t find that location!  
                 Please try typing out the whole 
                 city name or using a valid 5-digit zip code.' if city.nil? and zipcode.nil?
      end

      error
    end
  end
end
