class DateAct < ActiveRecord::Base

  has_many :acts, dependent: :destroy
end
