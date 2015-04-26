class ZipcodeReference < ActiveRecord::Base
  def self.find_zipcode(name)
    ZipcodeReference.where("short_name = '#{name.to_s}'").first['code']
  end
end
