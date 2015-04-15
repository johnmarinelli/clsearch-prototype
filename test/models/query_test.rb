require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Query three has one user at id 2" do
    assert_equal queries(:third).user.id, 2
  end

  test "Query one and two have same user owner" do
    assert_equal queries(:first).user.id, queries(:second).user.id
  end

  test "New query has no type errors" do 
    params = Search::Parameters.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :keywords => { :keywords => 'key, words' },
      :category => 'APET',
      :location => {
        :city => 'san francisco',
        :radius => 5
      }.to_json,
      :price_min => 1,
      :price_max => 100,
    })

    query = Query.new params.params
    query[:user_id] = users(:one).id
    assert_equal true, query.save
  end

  test "New query won't add an invalid key" do 
    params = Search::Parameters.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :keywords => { :keywords => 'key, words' },
      :category => 'APET',
      :location => {
        :city => 'san francisco',
        :radius => 5
      }.to_json,
      :price_min => 1,
      :price_max => 100,
      :invalid => 'I SHOULDN\'T BE HERE'
    })

    query = Query.new params.params
    query[:user_id] = users(:one).id
    query.save

    assert_equal query[:invalid], nil
  end
end
