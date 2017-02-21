require 'test_helper'

class DishMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dish_menu = dish_menus(:one)
  end

  test "should get index" do
    get dish_menus_url
    assert_response :success
  end

  test "should get new" do
    get new_dish_menu_url
    assert_response :success
  end

  test "should create dish_menu" do
    assert_difference('DishMenu.count') do
      post dish_menus_url, params: { dish_menu: {  } }
    end

    assert_redirected_to dish_menu_url(DishMenu.last)
  end

  test "should show dish_menu" do
    get dish_menu_url(@dish_menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_dish_menu_url(@dish_menu)
    assert_response :success
  end

  test "should update dish_menu" do
    patch dish_menu_url(@dish_menu), params: { dish_menu: {  } }
    assert_redirected_to dish_menu_url(@dish_menu)
  end

  test "should destroy dish_menu" do
    assert_difference('DishMenu.count', -1) do
      delete dish_menu_url(@dish_menu)
    end

    assert_redirected_to dish_menus_url
  end
end
