require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get example1" do
    get :example1
    assert_response :success
    assert_select "title", "Rails examples"
  end

  test "should get example2" do
    get :example2
    assert_response :success
  end

  test "should get example3" do
    get :example3
    assert_response :success
  end
end
