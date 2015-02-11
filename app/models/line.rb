class Line < ActiveRecord::Base

  has_many :jobs, dependent: :destroy 
  has_many :act_jobs, dependent: :destroy
  #validates :name, presence: true
end
