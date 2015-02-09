class ActJob < ActiveRecord::Base
  belongs_to :act
  belongs_to :line
end
