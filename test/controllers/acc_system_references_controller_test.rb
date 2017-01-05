require 'test_helper'

class AccSystemReferencesControllerTest < ActionController::TestCase
  setup do
    @acc_system_reference = acc_system_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acc_system_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acc_system_reference" do
    assert_difference('AccSystemReference.count') do
      post :create, acc_system_reference: { acc_system_id: @acc_system_reference.acc_system_id, new_client: @acc_system_reference.new_client, time_stamp: @acc_system_reference.time_stamp }
    end

    assert_redirected_to acc_system_reference_path(assigns(:acc_system_reference))
  end

  test "should show acc_system_reference" do
    get :show, id: @acc_system_reference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acc_system_reference
    assert_response :success
  end

  test "should update acc_system_reference" do
    patch :update, id: @acc_system_reference, acc_system_reference: { acc_system_id: @acc_system_reference.acc_system_id, new_client: @acc_system_reference.new_client, time_stamp: @acc_system_reference.time_stamp }
    assert_redirected_to acc_system_reference_path(assigns(:acc_system_reference))
  end

  test "should destroy acc_system_reference" do
    assert_difference('AccSystemReference.count', -1) do
      delete :destroy, id: @acc_system_reference
    end

    assert_redirected_to acc_system_references_path
  end
end
