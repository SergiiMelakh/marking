class ReportsController < ApplicationController

  def filter
  end

  def index
    @date_start = Date.civil(params[:date_start][:year].to_i, params[:date_start][:month].to_i, params[:date_start][:day].to_i)
    @date_end = Date.civil(params[:date_end][:year].to_i, params[:date_end][:month].to_i, params[:date_end][:day].to_i)
    @jobs_period = []
    
      if params[:filter][:street_id] == "1"
        DateJob.where("date >= ? AND date <= ?", @date_start, @date_end).find_each do |dj|
          dj.jobs.each do |j|
           @jobs_period << j 
          end
         end

      else
        DateJob.where("date >= ? AND date <= ?", @date_start, @date_end).find_each do |dj|
          dj.jobs.each do |j|
            if j.street_id == params[:filter][:street_id].to_i
              @jobs_period << j 
            end
          end
         end
      end


  end
end
