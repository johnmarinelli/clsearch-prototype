require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Search::Parameters can be initialized with a Query model" do
    query = queries(:second)
    tts = Search::APISearch.new
    tts.set_params query.attributes

    query.created_at = nil
    query.updated_at = nil
    
    target = {
      :id => 2,
      :title => 'title',
      :anchor => 123456789,
      :keywords => { "keywords" => "one, key" },
      :sources => nil,
      :price_min => 2,
      :price_max => 200,
      :category => 'APET',
      :location => { 'city' => 91707 },
      :user_id => 1,
      :created_at => nil,
      :updated_at => nil
    }
    #TODO
    #assert target == query.attributes.symbolize_keys, 'Query hash was not created correctly from Parameters object: ' + query.attributes.symbolize_keys.inspect + '\n' + target.inspect
  end

  test "Url is built correctly" do
    query = queries(:fourth)
    tts = Search::APISearch.new
    tts.set_params query.attributes
    endpoint = append_get_vars tts.api_url, tts.parameters.params

    target = "http://search.3taps.com?&auth_token="+ENV['API_KEY']+"&anchor=123456789&sources=CRAIG|AUTOC&keywords=abc|def&category=APET&location.city=12345&radius=10&price=4..400"
    assert target == endpoint, 'Endpoint not formed correctly. ACTUAL >> ' + endpoint + '    EXPECTED >> ' + target
  end
end
