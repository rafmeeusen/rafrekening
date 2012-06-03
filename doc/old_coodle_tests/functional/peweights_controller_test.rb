require 'test_helper'

class PeweightsControllerTest < ActionController::TestCase
  setup do
    @peweight = peweights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peweights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peweight" do
    assert_difference('Peweight.count') do
      post :create, peweight: @peweight.attributes
    end

    assert_redirected_to peweight_path(assigns(:peweight))
  end

  test "should show peweight" do
    get :show, id: @peweight.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @peweight.to_param
    assert_response :success
  end

  test "should update peweight" do
    put :update, id: @peweight.to_param, peweight: @peweight.attributes
    assert_redirected_to peweight_path(assigns(:peweight))
  end

  test "should destroy peweight" do
    assert_difference('Peweight.count', -1) do
      delete :destroy, id: @peweight.to_param
    end

    assert_redirected_to peweights_path
  end
end
