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

  test "edit should display correct short name for city" do 
    get(:edit, { 'id' => queries(:fourth).id })
    assert_select '#location[value=?]', 'Anaheim'
  end
  
  test "edit should display correct short name for zip code" do 
    get(:edit, { 'id' => queries(:third).id })
    assert_select '#location[value=?]', '91702'
  end

  test "should get destroy" do
    delete(:destroy, {'id' => queries(:first).id })
    assert_response :redirect
  end

  test "should create query" do
    assert_difference('Query.count') do 
      post :create, {
        :query => {
          :title => 'functional_1',
          :heading => 'kw1, kw2, kw3',
          :category_group => 'AAAA',
          :location => 'Anaheim',
          :radius => 5,
          :price_min => 0,
          :price_max => 100,
          :frequency => 'daily'
        }
      }
    end

    assert_redirected_to :controller => 'dashboard', :action => 'index'
  end

  test "no title should display a validation error" do
    post :create, {
      :query => {
        :title => '',
        :heading => 'kw1, kw2, kw3',
        :category_group => 'BBBB',
        :location => '0xdeadbeef',
        :frequency => 'daily'
      }
    }

    assert_select '#error-explanation'
  end


  test "no category_group should display a validation error" do
    post :create, {
      :query => {
        :title => 'title',
        :heading => 'kw1, kw2, kw3',
        :category_group => '',
        :location => '0xdeadbeef',
        :frequency => 'daily'
      }
    }

    assert_select '#error-explanation'
  end


  test "no frequency should display a validation error" do
    post :create, {
      :query => {
        :title => 'title',
        :heading => 'kw1, kw2, kw3',
        :category_group => 'category',
        :location => '0xdeadbeef',
        :frequency => ''
      }
    }

    assert_select '#error-explanation'
  end

  test "no keywords should display a validation error" do
    post :create, {
      :query => {
        :title => 'title',
        :heading => '',
        :category_group => 'category',
        :location => '0xdeadbeef',
        :frequency => 'daily'
      }
    }

    assert_select '#error-explanation'
  end

  test "should retain previous values on failed submission" do
    post :create, {
      :query => {
        :title => 'title',
        :heading => 'kw1, kw2, kw3',
        :category_group => 'category',
        :location => '0xdeadbeef',
        :frequency => ''
      }
    }

    assert_select '#error-explanation'
    assert_select '#query_title[value=?]', 'title'
    assert_select '#query_heading[value=?]', 'kw1, kw2, kw3'
  end

  test "it should edit a query" do
    patch :update, {
      :id => 1,
      :query => {
        :title => 'functional_1',
        :heading => 'kw1, kw2, kw3',
        :category_group => 'AAAA',
        :location => 'Anaheim',
        :radius => 5,
        :price_min => 0,
        :price_max => 100,
        :frequency => 'daily'
      }
    }

    assert_response :redirect
  end

  test "should retain previous values on failed edit submission" do
    patch :update, {
      :id => 1,
      :query => {
        :title => 'title',
        :heading => 'kw1, kw2, kw3',
        :category_group => 'category',
        :location => '0xdeadbeef',
        :frequency => ''
      }
    }

    assert_select '#error-explanation'
    assert_select '#query_title[value=?]', 'title'
    assert_select '#query_heading[value=?]', 'kw1, kw2, kw3'
  end
end
