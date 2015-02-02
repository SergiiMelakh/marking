class DateJob < ActiveRecord::Base


  validates :date, uniqueness: true
end
