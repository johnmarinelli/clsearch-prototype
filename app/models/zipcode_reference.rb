class ZipcodeReference < ActiveRecord::Base
  def self.find_zipcode(name)
    zipcode = ZipcodeReference.where("short_name = '#{name.to_s}'").first
    zipcode.nil? ? nil : zipcode['code']
  end
  
  def self.find_zipcode_by_code(code)
    zipcode = ZipcodeReference.where("code = '#{code.to_s}'").first
    zipcode.nil? ? code : zipcode['short_name']
  end
end
