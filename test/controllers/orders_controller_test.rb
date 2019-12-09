require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get check" do
    get orders_check_url
    assert_response :success
  end

  test "should get thanks" do
    get orders_thanks_url
    assert_response :success
  end

end
