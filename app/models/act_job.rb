class ActJob < ActiveRecord::Base
  belongs_to :act
  belongs_to :line

  validates :square, presence: true, numericality: {greater_than: 0.00}

  before_create do
  	self.square = self.square*1000*0.1
  end

end
