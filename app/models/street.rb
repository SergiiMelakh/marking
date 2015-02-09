class Street < ActiveRecord::Base

  has_many :jobs, dependent: :destroy
  has_many :acts, dependent: :destroy 
  validates :street, presence: true
end
