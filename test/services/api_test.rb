require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Search::Parameters can be initialized with a Query model" do
    query = queries(:second)
    tts = Search::APISearch.new
    tts.set_params query.attributes

    query.created_at = nil
    query.updated_at = nil
    
#    target = {
#      :id => 2,
#      :title => 'title',
#      :anchor => 123456789,
#      :keywords => { "keywords" => "one, key" },
#      :sources => nil,
#      :price_min => 2,
#      :price_max => 200,
#      :category_group => 'SSSS',
#      :location => { 'city' => 91707 },
#      :user_id => 1,
#      :created_at => nil,
#      :updated_at => nil,
#      :last_searched => Time.now
#    }
    #TODO
    #assert target == query.attributes.symbolize_keys, 'Query hash was not created correctly from Parameters object: ' + query.attributes.symbolize_keys.inspect + '\n' + target.inspect
  end

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
