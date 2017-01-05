require 'test_helper'

class LockTableNamesControllerTest < ActionController::TestCase
  setup do
    @lock_table_name = lock_table_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lock_table_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lock_table_name" do
    assert_difference('LockTableName.count') do
      post :create, lock_table_name: { name: @lock_table_name.name }
    end

    assert_redirected_to lock_table_name_path(assigns(:lock_table_name))
  end

  test "should show lock_table_name" do
    get :show, id: @lock_table_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lock_table_name
    assert_response :success
  end

  test "should update lock_table_name" do
    patch :update, id: @lock_table_name, lock_table_name: { name: @lock_table_name.name }
    assert_redirected_to lock_table_name_path(assigns(:lock_table_name))
  end

  test "should destroy lock_table_name" do
    assert_difference('LockTableName.count', -1) do
      delete :destroy, id: @lock_table_name
    end

    assert_redirected_to lock_table_names_path
  end
end
