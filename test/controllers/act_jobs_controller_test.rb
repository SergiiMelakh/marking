require 'test_helper'

class ActJobsControllerTest < ActionController::TestCase
  setup do
    @act_job = act_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:act_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create act_job" do
    assert_difference('ActJob.count') do
      post :create, act_job: { act_id: @act_job.act_id, line_id: @act_job.line_id, machine: @act_job.machine, square: @act_job.square }
    end

    assert_redirected_to act_job_path(assigns(:act_job))
  end

  test "should show act_job" do
    get :show, id: @act_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @act_job
    assert_response :success
  end

  test "should update act_job" do
    patch :update, id: @act_job, act_job: { act_id: @act_job.act_id, line_id: @act_job.line_id, machine: @act_job.machine, square: @act_job.square }
    assert_redirected_to act_job_path(assigns(:act_job))
  end

  test "should destroy act_job" do
    assert_difference('ActJob.count', -1) do
      delete :destroy, id: @act_job
    end

    assert_redirected_to act_jobs_path
  end
end
