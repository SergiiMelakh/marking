class DateJob < ActiveRecord::Base

  has_many :jobs, dependent: :destroy 
  validates :date, uniqueness: true
end
