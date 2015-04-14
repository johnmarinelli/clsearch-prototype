require 'test_helper'

class QueriesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get(:edit, { 'id' => queries(:first).id })
    assert_response :success
  end

  test "should get destroy" do
    delete(:destroy, {'id' => queries(:first).id })
    assert_response :redirect
  end

end
