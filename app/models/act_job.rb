class ActJob < ActiveRecord::Base
  belongs_to :act
  belongs_to :line

  validates :square, presence: true, numericality: {greater_than: 0.00}


  #Chenge KM/LIN to M2 to CREATE NEW RECORD
  before_create do
  	self.square *= 1000 * 0.1 if self.line.name == '1.1'
  end

  #Chenge KM/LIN to M2 to UPDATE EXIST RECORD
  before_update do
  	self.square *= 1000 * 0.1 if self.line.name == '1.1'
  end

end
