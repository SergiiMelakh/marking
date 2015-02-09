class DateAct < ActiveRecord::Base

  has_many :acts, dependent: :destroy
  validates :date, uniqueness: true

  accepts_nested_attributes_for :acts, allow_destroy: true, 
                reject_if: proc { |a| (a['number_act'].blank? || 
                                       a['money'].blank? ||
                                       a['street_id'] == '1')}
end
