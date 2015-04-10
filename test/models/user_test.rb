require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User model has many queries" do
    assert_equal User.reflect_on_association(:queries).macro, :has_many
  end

  test "User three has zero queries" do
    assert_equal users(:three).queries.length, 0
  end

  test"User two has one query" do
    assert_equal users(:two).queries.length, 1
  end

  test "User one has two queries" do
    assert_equal users(:one).queries.length, 2  
  end
end
