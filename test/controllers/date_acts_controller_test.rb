require 'test_helper'

class DateActsControllerTest < ActionController::TestCase
  setup do
    @date_act = date_acts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_acts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_act" do
    assert_difference('DateAct.count') do
      post :create, date_act: { date: @date_act.date }
    end

    assert_redirected_to date_act_path(assigns(:date_act))
  end

  test "should show date_act" do
    get :show, id: @date_act
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_act
    assert_response :success
  end

  test "should update date_act" do
    patch :update, id: @date_act, date_act: { date: @date_act.date }
    assert_redirected_to date_act_path(assigns(:date_act))
  end

  test "should destroy date_act" do
    assert_difference('DateAct.count', -1) do
      delete :destroy, id: @date_act
    end

    assert_redirected_to date_acts_path
  end
end
