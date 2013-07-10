require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get saved" do
    get :saved
    assert_response :success
  end

end
