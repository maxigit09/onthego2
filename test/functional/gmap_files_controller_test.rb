require 'test_helper'

class GmapFilesControllerTest < ActionController::TestCase
  setup do
    @gmap_file = gmap_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gmap_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gmap_file" do
    assert_difference('GmapFile.count') do
      post :create, gmap_file: @gmap_file.attributes
    end

    assert_redirected_to gmap_file_path(assigns(:gmap_file))
  end

  test "should show gmap_file" do
    get :show, id: @gmap_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gmap_file.to_param
    assert_response :success
  end

  test "should update gmap_file" do
    put :update, id: @gmap_file.to_param, gmap_file: @gmap_file.attributes
    assert_redirected_to gmap_file_path(assigns(:gmap_file))
  end

  test "should destroy gmap_file" do
    assert_difference('GmapFile.count', -1) do
      delete :destroy, id: @gmap_file.to_param
    end

    assert_redirected_to gmap_files_path
  end
end
