class Job < ActiveRecord::Base
  belongs_to :date_job
  belongs_to :line
  belongs_to :street

  validates :line_id,   presence: true
  validates :street_id, presence: true
  validates :square,    presence: true, numericality: {greater_than: 0.00}
end
