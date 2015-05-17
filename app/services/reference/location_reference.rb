module Reference
  class LocationReference
    def self.get_short_name_from_location_code(code)
      zipcode = ZipcodeReference.where('code=?', code).first
      zipcode.short_name unless zipcode.nil?
    end
  end
end
