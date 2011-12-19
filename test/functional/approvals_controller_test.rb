require 'test_helper'

class ApprovalsControllerTest < ActionController::TestCase
  setup do
    @approval = approvals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approvals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approval" do
    assert_difference('Approval.count') do
      post :create, approval: @approval.attributes
    end

    assert_redirected_to approval_path(assigns(:approval))
  end

  test "should show approval" do
    get :show, id: @approval.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @approval.to_param
    assert_response :success
  end

  test "should update approval" do
    put :update, id: @approval.to_param, approval: @approval.attributes
    assert_redirected_to approval_path(assigns(:approval))
  end

  test "should destroy approval" do
    assert_difference('Approval.count', -1) do
      delete :destroy, id: @approval.to_param
    end

    assert_redirected_to approvals_path
  end
end
