require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should show homepage" do
    get :index
    assert_response :success
  end

  test "should create a query from homepage" do
    assert_difference('Query.count') do 
      post :create_query_and_account, {
        :title => 'homepage',
        :keywords => 'kw1, kw2, kw3',
        :category => 'AAAA',
        :location_primary => 'Los Angeles',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => 'daily',
        :email => 'test@example.com'
      }

      assert_response :redirect
    end
  end
end
