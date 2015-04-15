require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Search::Parameters can be initialized with a Query model" do
    query = queries(:second)
    tts = Search::APISearch.new
    tts.set_params query.attributes
    p tts.inspect
  end
end
