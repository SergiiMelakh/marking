class ActJobsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_act_job, only: [:show, :edit, :update, :destroy]

  # GET /act_jobs
  # GET /act_jobs.json
  def index
    @act_jobs = ActJob.all
  end

  # GET /act_jobs/1
  # GET /act_jobs/1.json
  def show
  end

  # GET /act_jobs/new
  def new
    @act_job = ActJob.new
  end

  # GET /act_jobs/1/edit
  def edit
  end

  # POST /act_jobs
  # POST /act_jobs.json
  def create
    @act_job = ActJob.new(act_job_params)

    respond_to do |format|
      if @act_job.save
        format.html { redirect_to @act_job, notice: 'Act job was successfully created.' }
        format.json { render :show, status: :created, location: @act_job }
      else
        format.html { render :new }
        format.json { render json: @act_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /act_jobs/1
  # PATCH/PUT /act_jobs/1.json
  def update
    respond_to do |format|
      if @act_job.update(act_job_params)
        format.html { redirect_to @act_job, notice: 'Act job was successfully updated.' }
        format.json { render :show, status: :ok, location: @act_job }
      else
        format.html { render :edit }
        format.json { render json: @act_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /act_jobs/1
  # DELETE /act_jobs/1.json
  def destroy
    @act_job.destroy
    respond_to do |format|
      format.html { redirect_to act_jobs_url, notice: 'Act job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act_job
      @act_job = ActJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def act_job_params
      params.require(:act_job).permit(:act_id, :line_id, :square, :machine)
    end
end
