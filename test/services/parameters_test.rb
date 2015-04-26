require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Search::Parameters price string is formed correctly with :price_min parameter" do
    params = Search::Parameters.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :location => {
        :city => 'san francisco',
        :radius => 5
      }.to_json,
      :price_min => 1,
    })

    assert params.params[:price] == '1..'
  end

  test "Search::Parameters price string is formed correctly with :price_max parameter" do
    params = Search::Parameters.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :location => {
        :city => 'san francisco',
        :radius => 5
      }.to_json,
      :price_max => 100,
    })

    assert params.params[:price] == '..100'
  end

  test "Search::Parameters price string is formed correctly with both parameters" do
    params = Search::Parameters.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :location => {
        :city => 'san francisco',
        :radius => 5
      }.to_json,
      :price_min => 1,
      :price_max => 100,
    })

    assert params.params[:price] == '1..100'
  end
  
  test "Search::Parameters price string is formed correctly with both parameters backwards" do
    params = Search::Parameters.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :location => {
        :city => 'san francisco',
        :radius => 5
      }.to_json,
      :price_max => 100,
      :price_min => 1
    })

    assert params.params[:price] == '1..100'
  end
end
