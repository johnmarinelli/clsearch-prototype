require 'test_helper'

class QueriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    sign_in User.last
  end

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

  test "should create query" do
    assert_difference('Query.count') do 
      post :create, {
        :title => 'functional_1',
        :keywords => 'kw1, kw2, kw3',
        :category => 'AAAA',
        :location_primary => 'Anaheim',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => 'daily'
      }
    end

    assert_redirected_to :controller => 'dashboard', :action => 'index'
  end

  test "no title should display a validation error" do
    post :create, {
      :title => '',
      :keywords => 'kw1, kw2, kw3',
      :category => 'BBBB',
      :location_primary => '0xdeadbeef',
      :frequency => 'daily'
    }

    assert_select '#error-explanation'
  end


  test "no category should display a validation error" do
    post :create, {
      :title => 'title',
      :keywords => 'kw1, kw2, kw3',
      :category => '',
      :location_primary => '0xdeadbeef',
      :frequency => 'daily'
    }

    assert_select '#error-explanation'
  end


  test "no frequency should display a validation error" do
    post :create, {
      :title => 'title',
      :keywords => 'kw1, kw2, kw3',
      :category => 'category',
      :location_primary => '0xdeadbeef',
      :frequency => ''
    }

    assert_select '#error-explanation'
  end


  test "no keywords should display a validation error" do
    post :create, {
      :title => 'title',
      :keywords => '',
      :category => 'category',
      :location_primary => '0xdeadbeef',
      :frequency => 'daily'
    }

    assert_select '#error-explanation'
  end
end
