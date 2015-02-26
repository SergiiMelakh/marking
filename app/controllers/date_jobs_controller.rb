class DateJobsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_date_job, only: [:show, :edit, :update, :destroy]

  # GET /date_jobs
  # GET /date_jobs.json
  def index
    @date_jobs = DateJob.order(:date)
  end

  # GET /date_jobs/1
  # GET /date_jobs/1.json
  def show
  end

  # GET /date_jobs/new
  def new
    @date_job = DateJob.new
        @date_job.jobs.build
  end

  # GET /date_jobs/1/edit
  def edit
    @date_job.date = @date_job.date.strftime('%d/%m/%Y')
    @date_job.jobs.build


  end

  # POST /date_jobs
  # POST /date_jobs.json
  def create
    @date_job = DateJob.new(date_job_params)

    respond_to do |format|
      if @date_job.save
        format.html { redirect_to @date_job, notice: 'Date job was successfully created.' }
        format.json { render :show, status: :created, location: @date_job }
      else
        format.html { render :new }
        format.json { render json: @date_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_jobs/1
  # PATCH/PUT /date_jobs/1.json
  def update
    respond_to do |format|
      if @date_job.update(date_job_params)
        format.html { redirect_to @date_job, notice: 'Date job was successfully updated.' }
        format.json { render :show, status: :ok, location: @date_job }
      else
        format.html { render :edit }
        format.json { render json: @date_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_jobs/1
  # DELETE /date_jobs/1.json
  def destroy
    @date_job.destroy
    respond_to do |format|
      format.html { redirect_to date_jobs_url, notice: 'Date job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_job
      @date_job = DateJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_job_params
      params.require(:date_job).permit(:date, jobs_attributes: [:id, :date_job_id, :line_id, :square, :street_id, :house, :note, :_destroy])
    end
end

