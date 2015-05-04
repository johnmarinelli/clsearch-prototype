class ZipcodeReference < ActiveRecord::Base
  def self.find_zipcode(name)
    ZipcodeReference.where("short_name = '#{name.to_s}'").first['code']
  end
  
  def self.find_zipcode_by_code(code)
    ZipcodeReference.where("code = '#{code.to_s}'").first['short_name']
  end
end
