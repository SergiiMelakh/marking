class ReportsController < ApplicationController
  def filter

  end

  def index
    @date_start = Date.civil(params[:date_start][:year].to_i, params[:date_start][:month].to_i, params[:date_start][:day].to_i)
    @date_end = Date.civil(params[:date_end][:year].to_i, params[:date_end][:month].to_i, params[:date_end][:day].to_i)
    
    
      if params[:filter][:street_id] == "1"
        @jobs_period = DateJob.where("date >= ? AND date <= ?", @date_start, @date_end)
        #@all_jobs = 
      else
        #@jobs_period = DateJob.where("date >= ? AND date <= ?", @date_start, @date_end)
      end
  end
end
