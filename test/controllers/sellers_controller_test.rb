require 'test_helper'

class SellersControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
