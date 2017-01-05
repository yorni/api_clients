require 'test_helper'

class AccSystemsControllerTest < ActionController::TestCase
  setup do
    @acc_system = acc_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acc_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acc_system" do
    assert_difference('AccSystem.count') do
      post :create, acc_system: { name: @acc_system.name }
    end

    assert_redirected_to acc_system_path(assigns(:acc_system))
  end

  test "should show acc_system" do
    get :show, id: @acc_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acc_system
    assert_response :success
  end

  test "should update acc_system" do
    patch :update, id: @acc_system, acc_system: { name: @acc_system.name }
    assert_redirected_to acc_system_path(assigns(:acc_system))
  end

  test "should destroy acc_system" do
    assert_difference('AccSystem.count', -1) do
      delete :destroy, id: @acc_system
    end

    assert_redirected_to acc_systems_path
  end
end
