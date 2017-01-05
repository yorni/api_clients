require 'test_helper'

class PersonSyncsControllerTest < ActionController::TestCase
  setup do
    @person_sync = person_syncs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_syncs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_sync" do
    assert_difference('PersonSync.count') do
      post :create, person_sync: { person_id: @person_sync.person_id, time_stamp: @person_sync.time_stamp }
    end

    assert_redirected_to person_sync_path(assigns(:person_sync))
  end

  test "should show person_sync" do
    get :show, id: @person_sync
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_sync
    assert_response :success
  end

  test "should update person_sync" do
    patch :update, id: @person_sync, person_sync: { person_id: @person_sync.person_id, time_stamp: @person_sync.time_stamp }
    assert_redirected_to person_sync_path(assigns(:person_sync))
  end

  test "should destroy person_sync" do
    assert_difference('PersonSync.count', -1) do
      delete :destroy, id: @person_sync
    end

    assert_redirected_to person_syncs_path
  end
end
