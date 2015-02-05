class Line < ActiveRecord::Base

  has_many :jobs, dependent: :destroy 
  validates :name, presence: true
end