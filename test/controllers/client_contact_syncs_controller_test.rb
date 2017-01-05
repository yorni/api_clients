require 'test_helper'

class ClientContactSyncsControllerTest < ActionController::TestCase
  setup do
    @client_contact_sync = client_contact_syncs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_contact_syncs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_contact_sync" do
    assert_difference('ClientContactSync.count') do
      post :create, client_contact_sync: { client_contact_id: @client_contact_sync.client_contact_id, time_stamp: @client_contact_sync.time_stamp }
    end

    assert_redirected_to client_contact_sync_path(assigns(:client_contact_sync))
  end

  test "should show client_contact_sync" do
    get :show, id: @client_contact_sync
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_contact_sync
    assert_response :success
  end

  test "should update client_contact_sync" do
    patch :update, id: @client_contact_sync, client_contact_sync: { client_contact_id: @client_contact_sync.client_contact_id, time_stamp: @client_contact_sync.time_stamp }
    assert_redirected_to client_contact_sync_path(assigns(:client_contact_sync))
  end

  test "should destroy client_contact_sync" do
    assert_difference('ClientContactSync.count', -1) do
      delete :destroy, id: @client_contact_sync
    end

    assert_redirected_to client_contact_syncs_path
  end
end
