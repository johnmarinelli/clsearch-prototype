require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Location reference returns correct short names for given zip codes" do
    anaheim = 'USA-92808'
    anaheim_short_zip = Reference::LocationReference::get_short_name_from_location_code anaheim 

    assert anaheim_short_zip == '92808'
  end
end
