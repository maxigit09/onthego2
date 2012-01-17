require 'test_helper'

class BMapsControllerTest < ActionController::TestCase
  setup do
    @b_map = b_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:b_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create b_map" do
    assert_difference('BMap.count') do
      post :create, b_map: @b_map.attributes
    end

    assert_redirected_to b_map_path(assigns(:b_map))
  end

  test "should show b_map" do
    get :show, id: @b_map.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @b_map.to_param
    assert_response :success
  end

  test "should update b_map" do
    put :update, id: @b_map.to_param, b_map: @b_map.attributes
    assert_redirected_to b_map_path(assigns(:b_map))
  end

  test "should destroy b_map" do
    assert_difference('BMap.count', -1) do
      delete :destroy, id: @b_map.to_param
    end

    assert_redirected_to b_maps_path
  end
end
