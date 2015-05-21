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
  end
end
