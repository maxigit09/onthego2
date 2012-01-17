require 'test_helper'

class BemapsControllerTest < ActionController::TestCase
  setup do
    @bemap = bemaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bemaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bemap" do
    assert_difference('Bemap.count') do
      post :create, bemap: @bemap.attributes
    end

    assert_redirected_to bemap_path(assigns(:bemap))
  end

  test "should show bemap" do
    get :show, id: @bemap.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bemap.to_param
    assert_response :success
  end

  test "should update bemap" do
    put :update, id: @bemap.to_param, bemap: @bemap.attributes
    assert_redirected_to bemap_path(assigns(:bemap))
  end

  test "should destroy bemap" do
    assert_difference('Bemap.count', -1) do
      delete :destroy, id: @bemap.to_param
    end

    assert_redirected_to bemaps_path
  end
end
