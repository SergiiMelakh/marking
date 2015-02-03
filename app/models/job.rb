class Job < ActiveRecord::Base
  belongs_to :date_job
  belongs_to :line
  belongs_to :street
end
