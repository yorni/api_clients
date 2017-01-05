require 'test_helper'

class MainSystemsControllerTest < ActionController::TestCase
  setup do
    @main_system = main_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_system" do
    assert_difference('MainSystem.count') do
      post :create, main_system: { acc_system_id: @main_system.acc_system_id, period: @main_system.period }
    end

    assert_redirected_to main_system_path(assigns(:main_system))
  end

  test "should show main_system" do
    get :show, id: @main_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_system
    assert_response :success
  end

  test "should update main_system" do
    patch :update, id: @main_system, main_system: { acc_system_id: @main_system.acc_system_id, period: @main_system.period }
    assert_redirected_to main_system_path(assigns(:main_system))
  end

  test "should destroy main_system" do
    assert_difference('MainSystem.count', -1) do
      delete :destroy, id: @main_system
    end

    assert_redirected_to main_systems_path
  end
end
