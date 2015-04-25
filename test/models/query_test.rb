require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Query three has one user at id 2" do
    assert_equal queries(:third).user.id, 2
  end

  test "Query one and two have same user owner" do
    assert_equal queries(:first).user.id, queries(:second).user.id
  end
end
