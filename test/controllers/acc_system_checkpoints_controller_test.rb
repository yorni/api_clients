require 'test_helper'

class AccSystemCheckpointsControllerTest < ActionController::TestCase
  setup do
    @acc_system_checkpoint = acc_system_checkpoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acc_system_checkpoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acc_system_checkpoint" do
    assert_difference('AccSystemCheckpoint.count') do
      post :create, acc_system_checkpoint: { acc_system_id: @acc_system_checkpoint.acc_system_id, time_stamp: @acc_system_checkpoint.time_stamp }
    end

    assert_redirected_to acc_system_checkpoint_path(assigns(:acc_system_checkpoint))
  end

  test "should show acc_system_checkpoint" do
    get :show, id: @acc_system_checkpoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acc_system_checkpoint
    assert_response :success
  end

  test "should update acc_system_checkpoint" do
    patch :update, id: @acc_system_checkpoint, acc_system_checkpoint: { acc_system_id: @acc_system_checkpoint.acc_system_id, time_stamp: @acc_system_checkpoint.time_stamp }
    assert_redirected_to acc_system_checkpoint_path(assigns(:acc_system_checkpoint))
  end

  test "should destroy acc_system_checkpoint" do
    assert_difference('AccSystemCheckpoint.count', -1) do
      delete :destroy, id: @acc_system_checkpoint
    end

    assert_redirected_to acc_system_checkpoints_path
  end
end
