require 'test_helper'

class ShedsControllerTest < ActionController::TestCase
  setup do
    @shed = sheds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sheds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shed" do
    assert_difference('Shed.count') do
      post :create, shed: { name: @shed.name }
    end

    assert_redirected_to shed_path(assigns(:shed))
  end

  test "should show shed" do
    get :show, id: @shed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shed
    assert_response :success
  end

  test "should update shed" do
    patch :update, id: @shed, shed: { name: @shed.name }
    assert_redirected_to shed_path(assigns(:shed))
  end

  test "should destroy shed" do
    assert_difference('Shed.count', -1) do
      delete :destroy, id: @shed
    end

    assert_redirected_to sheds_path
  end
end
