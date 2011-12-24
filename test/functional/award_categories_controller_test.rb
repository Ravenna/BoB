require 'test_helper'

class AwardCategoriesControllerTest < ActionController::TestCase
  setup do
    @award_category = award_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:award_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create award_category" do
    assert_difference('AwardCategory.count') do
      post :create, award_category: @award_category.attributes
    end

    assert_redirected_to award_category_path(assigns(:award_category))
  end

  test "should show award_category" do
    get :show, id: @award_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @award_category.to_param
    assert_response :success
  end

  test "should update award_category" do
    put :update, id: @award_category.to_param, award_category: @award_category.attributes
    assert_redirected_to award_category_path(assigns(:award_category))
  end

  test "should destroy award_category" do
    assert_difference('AwardCategory.count', -1) do
      delete :destroy, id: @award_category.to_param
    end

    assert_redirected_to award_categories_path
  end
end
