require 'test_helper'

class ClientTypesControllerTest < ActionController::TestCase
  setup do
    @client_type = client_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_type" do
    assert_difference('ClientType.count') do
      post :create, client_type: { name: @client_type.name }
    end

    assert_redirected_to client_type_path(assigns(:client_type))
  end

  test "should show client_type" do
    get :show, id: @client_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_type
    assert_response :success
  end

  test "should update client_type" do
    patch :update, id: @client_type, client_type: { name: @client_type.name }
    assert_redirected_to client_type_path(assigns(:client_type))
  end

  test "should destroy client_type" do
    assert_difference('ClientType.count', -1) do
      delete :destroy, id: @client_type
    end

    assert_redirected_to client_types_path
  end
end
