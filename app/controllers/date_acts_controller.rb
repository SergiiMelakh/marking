class DateActsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_date_act, only: [:show, :edit, :update, :destroy]

  # GET /date_acts
  # GET /date_acts.json
  def index
    @date_acts = DateAct.order(:date)

    @sum_money = 0.00
    @date_acts.each do |date_act|
      date_act.acts.each do |act|
        @sum_money += act.money
      end
    end

    @sum_all_marking = Hash.new
    @sum_each_marking_temp = ActJob.group(:line_id).sum(:square)
    @sum_each_marking_temp.each {|key, val| @sum_all_marking["#{Line.find(key).name}"] = val}
    @sum_marking = @sum_all_marking.values.sum
  end

  # GET /date_acts/1
  # GET /date_acts/1.json
  def show

    @sum_marking_act = Hash.new
    @sum_marking_period = Hash.new
    sum_marking_period_temp = Hash.new
    @sum_money = 0.00

        @date_act.acts.each do |act|
          marking = 0.0
          sum_marking_period_temp.clear
          act.act_jobs.each do |act_job|
            marking += act_job.square.to_f
            sum_marking_period_temp = { "#{act_job.line.name}" => "#{act_job.square}".to_f }
            @sum_marking_period.merge!(sum_marking_period_temp){|key, v1, v2| (v1+v2) }
        end
      @sum_marking_act["#{act.number_act}"] = marking
      @sum_money += act.money
      end    

      @sum_all_marking_period = @sum_marking_period.values.sum
      #Вычисляем "контрольную" площадь по каждой улице за весь период
    @sum_marking_street = Hash.new                          
    @sum_marking_street = Job.group(:street_id).sum(:square)  
  end

  # GET /date_acts/new
  def new
    @date_act = DateAct.new
          act = @date_act.acts.build
             act.act_jobs.build 
    
  end

  # GET /date_acts/1/edit
  def edit

    @date_act.date = @date_act.date.strftime('%d/%m/%Y')
    #Chenge KM/LIME to M2 for LINE 1.1
    @date_act.acts.each do |act|
      act.act_jobs.each do |act_job|
        act_job.square /= 100 if act_job.line.name == '1.1'
      end
    end

    @date_act.acts.each { |act| 1.times {act.act_jobs.build} }

    act = @date_act.acts.build
       act.act_jobs.build 
    
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
