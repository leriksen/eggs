require 'test_helper'

class TraysControllerTest < ActionController::TestCase
  setup do
    @tray = trays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tray" do
    assert_difference('Tray.count') do
      post :create, tray: { tray_id: @tray.tray_id, washed: @tray.washed, waste: @tray.waste }
    end

    assert_redirected_to tray_path(assigns(:tray))
  end

  test "should show tray" do
    get :show, id: @tray
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tray
    assert_response :success
  end

  test "should update tray" do
    patch :update, id: @tray, tray: { tray_id: @tray.tray_id, washed: @tray.washed, waste: @tray.waste }
    assert_redirected_to tray_path(assigns(:tray))
  end

  test "should destroy tray" do
    assert_difference('Tray.count', -1) do
      delete :destroy, id: @tray
    end

    assert_redirected_to trays_path
  end
end
