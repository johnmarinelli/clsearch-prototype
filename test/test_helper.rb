ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def url_has_get_param_with_value(key, value, url)
    key += "="
    regex = /#{key}(.*?)&/
    match = url.match regex
    if match.nil?
      assert false, "No value found for #{key} in #{url}"
    else
      assert match[1] == value, "#{value} not found for #{key} in #{url}"
    end
  end
end
