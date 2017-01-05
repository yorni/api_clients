require 'test_helper'

class ClientSyncsControllerTest < ActionController::TestCase
  setup do
    @client_sync = client_syncs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_syncs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_sync" do
    assert_difference('ClientSync.count') do
      post :create, client_sync: { acc_system_id: @client_sync.acc_system_id, client_id: @client_sync.client_id, new_client: @client_sync.new_client, time_stamp: @client_sync.time_stamp }
    end

    assert_redirected_to client_sync_path(assigns(:client_sync))
  end

  test "should show client_sync" do
    get :show, id: @client_sync
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_sync
    assert_response :success
  end

  test "should update client_sync" do
    patch :update, id: @client_sync, client_sync: { acc_system_id: @client_sync.acc_system_id, client_id: @client_sync.client_id, new_client: @client_sync.new_client, time_stamp: @client_sync.time_stamp }
    assert_redirected_to client_sync_path(assigns(:client_sync))
  end

  test "should destroy client_sync" do
    assert_difference('ClientSync.count', -1) do
      delete :destroy, id: @client_sync
    end

    assert_redirected_to client_syncs_path
  end
end
