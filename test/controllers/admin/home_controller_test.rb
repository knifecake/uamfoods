require 'test_helper'

class Admin::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get admin_home_welcome_url
    assert_response :success
  end

end
