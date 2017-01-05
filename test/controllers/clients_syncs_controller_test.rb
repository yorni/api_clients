require 'test_helper'

class ClientsSyncsControllerTest < ActionController::TestCase
  setup do
    @clients_sync = clients_syncs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients_syncs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clients_sync" do
    assert_difference('ClientsSync.count') do
      post :create, clients_sync: { AccSystem_id: @clients_sync.AccSystem_id, client_id: @clients_sync.client_id, time_stamp: @clients_sync.time_stamp }
    end

    assert_redirected_to clients_sync_path(assigns(:clients_sync))
  end

  test "should show clients_sync" do
    get :show, id: @clients_sync
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clients_sync
    assert_response :success
  end

  test "should update clients_sync" do
    patch :update, id: @clients_sync, clients_sync: { AccSystem_id: @clients_sync.AccSystem_id, client_id: @clients_sync.client_id, time_stamp: @clients_sync.time_stamp }
    assert_redirected_to clients_sync_path(assigns(:clients_sync))
  end

  test "should destroy clients_sync" do
    assert_difference('ClientsSync.count', -1) do
      delete :destroy, id: @clients_sync
    end

    assert_redirected_to clients_syncs_path
  end
end
