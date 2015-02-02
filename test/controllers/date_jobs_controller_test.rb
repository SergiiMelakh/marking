require 'test_helper'

class DateJobsControllerTest < ActionController::TestCase
  setup do
    @date_job = date_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_job" do
    assert_difference('DateJob.count') do
      post :create, date_job: { date: @date_job.date }
    end

    assert_redirected_to date_job_path(assigns(:date_job))
  end

  test "should show date_job" do
    get :show, id: @date_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_job
    assert_response :success
  end

  test "should update date_job" do
    patch :update, id: @date_job, date_job: { date: @date_job.date }
    assert_redirected_to date_job_path(assigns(:date_job))
  end

  test "should destroy date_job" do
    assert_difference('DateJob.count', -1) do
      delete :destroy, id: @date_job
    end

    assert_redirected_to date_jobs_path
  end
end
