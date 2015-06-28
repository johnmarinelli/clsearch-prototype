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
  
  test "Search::Parameters radius is formed correctly with radius='Anywhere'" do
    mock_input = {
      :title => 'title',
      :heading => 'a, b, c, d',
      :category_group => 'AAAA',
      :location => '91701',
      :radius => 'Anywhere',
      :price_min => 0,
      :price_max => 100,
      :frequency => 'weekly'
    }

    q = Query.create(Search::Parameters.construct_parameters_from_input mock_input)
    assert q.radius == '', "Radius not set correctly when value=Anywhere: #{q.radius}"
  end
end
