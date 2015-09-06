require 'test_helper'

class TrayTypesControllerTest < ActionController::TestCase
  setup do
    @tray_type = tray_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tray_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tray_type" do
    assert_difference('TrayType.count') do
      post :create, tray_type: { type: @tray_type.type }
    end

    assert_redirected_to tray_type_path(assigns(:tray_type))
  end

  test "should show tray_type" do
    get :show, id: @tray_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tray_type
    assert_response :success
  end

  test "should update tray_type" do
    patch :update, id: @tray_type, tray_type: { type: @tray_type.type }
    assert_redirected_to tray_type_path(assigns(:tray_type))
  end

  test "should destroy tray_type" do
    assert_difference('TrayType.count', -1) do
      delete :destroy, id: @tray_type
    end

    assert_redirected_to tray_types_path
  end
end
