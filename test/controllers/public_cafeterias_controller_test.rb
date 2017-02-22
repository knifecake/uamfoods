require 'test_helper'

class PublicCafeteriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cafeterias_index_url
    assert_response :success
  end

  test "should get show" do
    get public_cafeterias_show_url
    assert_response :success
  end

end
