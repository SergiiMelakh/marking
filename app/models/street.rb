class Street < ActiveRecord::Base

  has_many :jobs, dependent: :destroy 
  validates :street, presence: true
end
