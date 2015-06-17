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
  end

  test "Daily query is scheduled" do
    query = queries(:third)
    assert query.is_scheduled?, 'Daily query is not scheduled but should be'
  end

  test "Daily query is not scheduled" do
    query = queries(:second)
    assert !query.is_scheduled?, 'Daily query is scheduled but shouldn\'t be'
  end

  test "Weekly query is scheduled" do
    query = queries(:first)
    assert query.is_scheduled?, 'Weekly query is not scheduled but should be'
  end

  test "Weekly query is not scheduled" do
    query = queries(:fourth)
    assert !query.is_scheduled?, 'Weekly query is scheduled but shouldn\'t be'
  end
end
