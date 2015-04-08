require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "User model has many queries" do
    assert_equal User.reflect_on_all_associations, ['Query']
  end
end
