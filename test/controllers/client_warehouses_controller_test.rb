require 'test_helper'

class ClientWarehousesControllerTest < ActionController::TestCase
  setup do
    @client_warehouse = client_warehouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_warehouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_warehouse" do
    assert_difference('ClientWarehouse.count') do
      post :create, client_warehouse: { client_id: @client_warehouse.client_id, warehouse_id: @client_warehouse.warehouse_id }
    end

    assert_redirected_to client_warehouse_path(assigns(:client_warehouse))
  end

  test "should show client_warehouse" do
    get :show, id: @client_warehouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_warehouse
    assert_response :success
  end

  test "should update client_warehouse" do
    patch :update, id: @client_warehouse, client_warehouse: { client_id: @client_warehouse.client_id, warehouse_id: @client_warehouse.warehouse_id }
    assert_redirected_to client_warehouse_path(assigns(:client_warehouse))
  end

  test "should destroy client_warehouse" do
    assert_difference('ClientWarehouse.count', -1) do
      delete :destroy, id: @client_warehouse
    end

    assert_redirected_to client_warehouses_path
  end
end
