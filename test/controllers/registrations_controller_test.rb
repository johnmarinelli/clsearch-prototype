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
        :user => {
          :email => "ab@c.com"
        }
      }
    end
    assert_response 302
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
        :user => {
          :email => "abc@d.com"
        }
      }
    end
    assert_response 302
  end

  test "should not create a user" do
    assert_no_difference('User.count') do 
      post :create, {
        :title => 'from home page 2',
        :keywords => 'kw1, kw2, kw3',
        :category => 'AAAA',
        :location_primary => 'Chicago',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => 'daily',
        :user => {
          :email => ""
        }
      }
    end
  end
  
  test "should not create a query given bad user input" do
    assert_no_difference('Query.count') do 
      post :create, {
        :title => 'from home page 2',
        :keywords => 'kw1, kw2, kw3',
        :category => 'AAAA',
        :location_primary => 'Chicago',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => 'daily',
        :user => {
          :email => ""
        }
      }
    end
  end

  test "should not create a user given bad query input" do
    assert_no_difference('User.count') do 
      post :create, {
        :title => '',
        :keywords => '',
        :category => '',
        :location_primary => '',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => '',
        :user => {
          :email => "asf@aemail.com"
        }
      }
    end
  end
end
