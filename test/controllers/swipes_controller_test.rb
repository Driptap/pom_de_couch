require 'test_helper'

class SwipesControllerTest < ActionController::TestCase
  test "should get watch" do
    get :watch
    assert_response :success
  end

  test "should get like" do
    get :like
    assert_response :success
  end

  test "should get dont_like" do
    get :dont_like
    assert_response :success
  end

  test "should get watched" do
    get :watched
    assert_response :success
  end

  test "should get info" do
    get :info
    assert_response :success
  end

end
