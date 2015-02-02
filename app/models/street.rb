class Street < ActiveRecord::Base

  
  validates :street, presence: true
end
