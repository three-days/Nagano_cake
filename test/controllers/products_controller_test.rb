require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get products_top_url
    assert_response :success
  end

end
