class DateJob < ActiveRecord::Base

  has_many :jobs, dependent: :destroy 
  validates :date, uniqueness: true
  
  accepts_nested_attributes_for :jobs, allow_destroy: true, 
                reject_if: proc { |a| (a['square'].blank? || a['line_id'] == '1')}
end
