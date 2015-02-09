require 'test_helper'

class ActsControllerTest < ActionController::TestCase
  setup do
    @act = acts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create act" do
    assert_difference('Act.count') do
      post :create, act: { date_act_id: @act.date_act_id, money: @act.money, number_act: @act.number_act, street_id: @act.street_id }
    end

    assert_redirected_to act_path(assigns(:act))
  end

  test "should show act" do
    get :show, id: @act
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @act
    assert_response :success
  end

  test "should update act" do
    patch :update, id: @act, act: { date_act_id: @act.date_act_id, money: @act.money, number_act: @act.number_act, street_id: @act.street_id }
    assert_redirected_to act_path(assigns(:act))
  end

  test "should destroy act" do
    assert_difference('Act.count', -1) do
      delete :destroy, id: @act
    end

    assert_redirected_to acts_path
  end
end
