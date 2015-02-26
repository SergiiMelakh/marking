class ReportsController < ApplicationController
  before_filter :authenticate_user!
  def filter
  end

  def index
    @date_start = params[:filter][:date_start].to_date
    @date_end = params[:filter][:date_end].to_date
    @jobs_period = Array.new
    @sum_marking = Hash.new
    
      if params[:filter][:street_id] == "1"
        DateJob.order(:date).where("date >= ? AND date <= ?", @date_start, @date_end).each do |date_job|
            date_job.jobs.each do |job|
             @jobs_period << job 
             marking = {"#{job.line.name}" => "#{job.square}".to_f}
             @sum_marking.merge!(marking){|key, v1, v2| (v1+v2) }            
          end
         end

      else
        DateJob.order(:date).where("date >= ? AND date <= ?", @date_start, @date_end).each do |date_job|
          date_job.jobs.each do |job|
            if job.street_id == params[:filter][:street_id].to_i
              @jobs_period << job 
              marking = {"#{job.line.name}" => "#{job.square}".to_f}
              @sum_marking.merge!(marking){|key, v1, v2| v1+v2}              
            end
          end
         end
      end
      @sum_all_marking = @sum_marking.values.sum

  end
end
