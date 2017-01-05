require 'test_helper'

class ClientDocumentSyncsControllerTest < ActionController::TestCase
  setup do
    @client_document_sync = client_document_syncs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_document_syncs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_document_sync" do
    assert_difference('ClientDocumentSync.count') do
      post :create, client_document_sync: { Client_document_id: @client_document_sync.Client_document_id, time_stamp: @client_document_sync.time_stamp }
    end

    assert_redirected_to client_document_sync_path(assigns(:client_document_sync))
  end

  test "should show client_document_sync" do
    get :show, id: @client_document_sync
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_document_sync
    assert_response :success
  end

  test "should update client_document_sync" do
    patch :update, id: @client_document_sync, client_document_sync: { Client_document_id: @client_document_sync.Client_document_id, time_stamp: @client_document_sync.time_stamp }
    assert_redirected_to client_document_sync_path(assigns(:client_document_sync))
  end

  test "should destroy client_document_sync" do
    assert_difference('ClientDocumentSync.count', -1) do
      delete :destroy, id: @client_document_sync
    end

    assert_redirected_to client_document_syncs_path
  end
end
