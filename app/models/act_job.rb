class ActJob < ActiveRecord::Base
  belongs_to :act
  belongs_to :line

  validates :square, presence: true, numericality: {greater_than: 0.00}
end
