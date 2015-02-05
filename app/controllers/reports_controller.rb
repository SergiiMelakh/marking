class ReportsController < ApplicationController

  def filter
  end

  def index
    @date_start = Date.civil(params[:date_start][:year].to_i, params[:date_start][:month].to_i, params[:date_start][:day].to_i)
    @date_end = Date.civil(params[:date_end][:year].to_i, params[:date_end][:month].to_i, params[:date_end][:day].to_i)
    @jobs_period = Array.new
    @sum_marking = Hash.new
    
      if params[:filter][:street_id] == "1"
        DateJob.where("date >= ? AND date <= ?", @date_start, @date_end).find_each do |dj|
            dj.jobs.each do |j|
             @jobs_period << j 
             marking = {"#{j.line.name}" => "#{j.square}".to_f}
             @sum_marking.merge!(marking){|key, v1, v2| (v1+v2) }            
          end
         end

      else
        DateJob.where("date >= ? AND date <= ?", @date_start, @date_end).find_each do |dj|
          dj.jobs.each do |j|
            if j.street_id == params[:filter][:street_id].to_i
              @jobs_period << j 
              marking = {"#{j.line.name}" => "#{j.square}".to_f}
              @sum_marking.merge!(marking){|key, v1, v2| v1+v2}              
            end
          end
         end
      end
      @sum_all_marking = @sum_marking.values.sum

  end
end
