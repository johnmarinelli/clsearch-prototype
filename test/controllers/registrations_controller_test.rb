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

  test "should create query" do
    assert_difference('Query.count') do 
      post :create, {
        :user => {
          :email => 'email@email.com',
          'queries_attributes' => { 
            '0' =>
            {
              :title => 'from home page',
              :heading => 'kw1, kw2, kw3',
              :category_group => 'AAAA',
              :location => 'Chicago',
              :radius => 5,
              :price_min => 0,
              :price_max => 100,
              :frequency => 'daily',
            }
          }
        }
      }
    end

    assert_response :redirect
  end

  test "should create a user" do
    assert_difference('User.count') do 
      post :create, {
        :user => {
          :email => 'email@email.com',
          'queries_attributes' => { 
            '0' =>
            {
              :title => 'from home page',
              :heading => 'kw1, kw2, kw3',
              :category_group => 'AAAA',
              :location => 'Chicago',
              :radius => 5,
              :price_min => 0,
              :price_max => 100,
              :frequency => 'daily',
            }
          }
        }
      }
    end
  end

  test "should not create a user given no email" do
    assert_no_difference('User.count') do 
      post :create, {
        :user => {
          :email => '',
          'queries_attributes' => { 
            '0' =>
            {
              :title => 'from home page',
              :heading => 'kw1, kw2, kw3',
              :category_group => 'AAAA',
              :location => 'Chicago',
              :radius => 5,
              :price_min => 0,
              :price_max => 100,
              :frequency => 'daily',
            }
          }
        }
      }
    end
    assert_response :success
  end

  test "should not create a query given no email" do
    assert_no_difference('Query.count') do 
      post :create, {
        :user => {
          :email => '',
          'queries_attributes' => { 
            '0' =>
            {
              :title => 'from home page',
              :heading => 'kw1, kw2, kw3',
              :category_group => 'AAAA',
              :location => 'Chicago',
              :radius => 5,
              :price_min => 0,
              :price_max => 100,
              :frequency => 'daily',
            }
          }
        }
      }
    end
    assert_response :success
  end

  test "should not create a user given bad query input" do
    assert_no_difference('User.count') do 
      post :create, {
        :user => {
          :email => '',
          'queries_attributes' => { 
            '0' =>
            {
              :title => 'from home page',
              :heading => '',
              :category_group => 'AAAA',
              :location => 'Chicago',
              :radius => 5,
              :price_min => 0,
              :price_max => 100,
              :frequency => 'daily',
            }
          }
        }
      }
    end
    assert_response :success
  end

  test "should keep previous values of a failed form" do
    post :create, {
      :user => {
        :email => '',
        'queries_attributes' => { 
          '0' =>
          {
            :title => 'from home page',
            :heading => 'kw1, kw2, kw3',
            :category_group => 'AAAA',
            :location => 'Chicago',
            :radius => 5,
            :price_min => 0,
            :price_max => 100,
            :frequency => 'daily',
          }
        }
      }
    }

    assert_select '#error_explanation'
    assert_select '#user_queries_attributes_0_title[value=?]', 'from home page'
    assert_select '#user_queries_attributes_0_heading[value=?]', 'kw1, kw2, kw3'
    assert_select '#location[value=?]', 'Chicago'
    assert_select '#error_explanation'
  end
  
  test "should create user given only email" do
    assert_difference('User.count') do 
      post :create, {
        :user => {
          :email => 'j@a.com'
        }
      }
    end
    assert_response :redirect
  end
end
