module Reference
  class LocationReference
    def self.get_short_name_from_location_code(code)
      ZipcodeReference.where('code=?', 'USA-92808').first.short_name
    end
  end
end
