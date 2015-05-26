require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create query and a user" do
    assert_difference('Query.count') do 
      post :create, {
        :title => 'from home page',
        :keywords => 'kw1, kw2, kw3',
        :category => 'AAAA',
        :location_primary => 'Chicago',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => 'daily',
        :email => "ab@c.com"
      }
    end
  end

  test "should create a user" do
    assert_difference('User.count') do 
      post :create, {
        :title => 'from home page 2',
        :keywords => 'kw1, kw2, kw3',
        :category => 'AAAA',
        :location_primary => 'Chicago',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => 'daily',
        :email => "abc@d.com"
      }
    end
  end
end
