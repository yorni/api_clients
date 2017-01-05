require 'test_helper'

class ClientsNonactivitiesControllerTest < ActionController::TestCase
  setup do
    @clients_nonactivity = clients_nonactivities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients_nonactivities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clients_nonactivity" do
    assert_difference('ClientsNonactivity.count') do
      post :create, clients_nonactivity: { acc_system_id: @clients_nonactivity.acc_system_id, client_id: @clients_nonactivity.client_id }
    end

    assert_redirected_to clients_nonactivity_path(assigns(:clients_nonactivity))
  end

  test "should show clients_nonactivity" do
    get :show, id: @clients_nonactivity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clients_nonactivity
    assert_response :success
  end

  test "should update clients_nonactivity" do
    patch :update, id: @clients_nonactivity, clients_nonactivity: { acc_system_id: @clients_nonactivity.acc_system_id, client_id: @clients_nonactivity.client_id }
    assert_redirected_to clients_nonactivity_path(assigns(:clients_nonactivity))
  end

  test "should destroy clients_nonactivity" do
    assert_difference('ClientsNonactivity.count', -1) do
      delete :destroy, id: @clients_nonactivity
    end

    assert_redirected_to clients_nonactivities_path
  end
end
