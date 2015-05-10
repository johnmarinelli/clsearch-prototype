require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Query three has one user at id 2" do
    assert_equal queries(:third).user.id, 2
  end

  test "Query one and two have same user owner" do
    assert_equal queries(:first).user.id, queries(:second).user.id
  end

  test "Query has correct presence specifiers" do
    query = Query.new
    assert_not query.valid?
    assert_equal [:title, :category_group], query.errors.keys, "Query created without title or category group"
  end
end
