require 'test_helper'

class ClientDocumentsControllerTest < ActionController::TestCase
  setup do
    @client_document = client_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_document" do
    assert_difference('ClientDocument.count') do
      post :create, client_document: { client_id: @client_document.client_id, doc_number: @client_document.doc_number, doc_serial: @client_document.doc_serial, doc_type_id: @client_document.doc_type_id }
    end

    assert_redirected_to client_document_path(assigns(:client_document))
  end

  test "should show client_document" do
    get :show, id: @client_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_document
    assert_response :success
  end

  test "should update client_document" do
    patch :update, id: @client_document, client_document: { client_id: @client_document.client_id, doc_number: @client_document.doc_number, doc_serial: @client_document.doc_serial, doc_type_id: @client_document.doc_type_id }
    assert_redirected_to client_document_path(assigns(:client_document))
  end

  test "should destroy client_document" do
    assert_difference('ClientDocument.count', -1) do
      delete :destroy, id: @client_document
    end

    assert_redirected_to client_documents_path
  end
end
