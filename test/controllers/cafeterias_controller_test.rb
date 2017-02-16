require 'test_helper'

class CafeteriasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cafeteria = cafeterias(:one)
  end

  test "should get index" do
    get cafeterias_url
    assert_response :success
  end

  test "should get new" do
    get new_cafeteria_url
    assert_response :success
  end

  test "should create cafeteria" do
    assert_difference('Cafeteria.count') do
      post cafeterias_url, params: { cafeteria: { hours: @cafeteria.hours, location: @cafeteria.location, name: @cafeteria.name, needs_mentor: @cafeteria.needs_mentor, phone: @cafeteria.phone } }
    end

    assert_redirected_to cafeteria_url(Cafeteria.last)
  end

  test "should show cafeteria" do
    get cafeteria_url(@cafeteria)
    assert_response :success
  end

  test "should get edit" do
    get edit_cafeteria_url(@cafeteria)
    assert_response :success
  end

  test "should update cafeteria" do
    patch cafeteria_url(@cafeteria), params: { cafeteria: { hours: @cafeteria.hours, location: @cafeteria.location, name: @cafeteria.name, needs_mentor: @cafeteria.needs_mentor, phone: @cafeteria.phone } }
    assert_redirected_to cafeteria_url(@cafeteria)
  end

  test "should destroy cafeteria" do
    assert_difference('Cafeteria.count', -1) do
      delete cafeteria_url(@cafeteria)
    end

    assert_redirected_to cafeterias_url
  end
end
