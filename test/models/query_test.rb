require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Query three has one user at id 2" do
    assert_equal queries(:third).user.id, 2
  end

  test "Query one and two have same user owner" do
    assert_equal queries(:first).user.id, queries(:second).user.id
  end

  test "New query has no type errors" do 
    query = Query.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :keywords => { :keywords => ['key', 'words'] },
      :categories => { :category => 'category' },
      :location => {
        :city => 'san francisico',
        :radius => 5
      }.to_json,
      :price_min => 1,
      :price_max => 100,

      :user_id => users(:one).id
    })
  end
end
