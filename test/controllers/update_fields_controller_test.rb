require 'test_helper'

class UpdateFieldsControllerTest < ActionController::TestCase
  setup do
    @update_field = update_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:update_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create update_field" do
    assert_difference('UpdateField.count') do
      post :create, update_field: { client_sync_id: @update_field.client_sync_id, name: @update_field.name, value: @update_field.value }
    end

    assert_redirected_to update_field_path(assigns(:update_field))
  end

  test "should show update_field" do
    get :show, id: @update_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @update_field
    assert_response :success
  end

  test "should update update_field" do
    patch :update, id: @update_field, update_field: { client_sync_id: @update_field.client_sync_id, name: @update_field.name, value: @update_field.value }
    assert_redirected_to update_field_path(assigns(:update_field))
  end

  test "should destroy update_field" do
    assert_difference('UpdateField.count', -1) do
      delete :destroy, id: @update_field
    end

    assert_redirected_to update_fields_path
  end
end
