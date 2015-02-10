class DateActsController < ApplicationController
  before_action :set_date_act, only: [:show, :edit, :update, :destroy]

  # GET /date_acts
  # GET /date_acts.json
  def index
    @date_acts = DateAct.all
  end

  # GET /date_acts/1
  # GET /date_acts/1.json
  def show
  end

  # GET /date_acts/new
  def new
    @date_act = DateAct.new
    2.times do 
      act = @date_act.acts.build
      4.times { act.act_jobs.build }
    end
  end

  # GET /date_acts/1/edit
  def edit
    @date_act.acts.each { |act| 3.times {act.act_jobs.build} }

    2.times do 
      act = @date_act.acts.build
      4.times { act.act_jobs.build }
    end
  end

  # POST /date_acts
  # POST /date_acts.json
  def create
    @date_act = DateAct.new(date_act_params)

    respond_to do |format|
      if @date_act.save
        format.html { redirect_to @date_act, notice: 'Date act was successfully created.' }
        format.json { render :show, status: :created, location: @date_act }
      else
        format.html { render :new }
        format.json { render json: @date_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_acts/1
  # PATCH/PUT /date_acts/1.json
  def update
    respond_to do |format|
      if @date_act.update(date_act_params)
        format.html { redirect_to @date_act, notice: 'Date act was successfully updated.' }
        format.json { render :show, status: :ok, location: @date_act }
      else
        format.html { render :edit }
        format.json { render json: @date_act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_acts/1
  # DELETE /date_acts/1.json
  def destroy
    @date_act.destroy
    respond_to do |format|
      format.html { redirect_to date_acts_url, notice: 'Date act was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_act
      @date_act = DateAct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_act_params
      params.require(:date_act).permit(:date, 
              acts_attributes: [:id, :date_act_id, :money, :number_act, :street_id, :_destroy, 
                  act_jobs_attributes: [:id, :act_id, :line_id, :square, :machine, :_destroy]])
    end
end
