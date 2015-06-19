require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Url is built correctly" do
    query = queries(:fourth)
    tts = Search::APISearch.new
    tts.set_params query.attributes
    endpoint = append_get_vars tts.api_url, tts.parameters.params

    url_has_get_param_with_value 'auth_token', ENV['API_KEY'], endpoint
    url_has_get_param_with_value 'anchor', '123456789', endpoint
    url_has_get_param_with_value 'sources', 'CRAIG|AUTOC', endpoint
    url_has_get_param_with_value 'heading', 'abc|def', endpoint
    url_has_get_param_with_value 'category_group', 'SSSS', endpoint
    url_has_get_param_with_value 'location.city', 'USA-LAX-ANA', endpoint
    url_has_get_param_with_value 'radius', '10', endpoint 
    url_has_get_param_with_value 'price', '4..400', endpoint
  end
end
