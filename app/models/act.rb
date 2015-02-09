class Act < ActiveRecord::Base
  belongs_to :date_act
  belongs_to :street

  has_many :act_jobs, dependent: :destroy
  validates :number_act, presence: true, uniqueness: true
  validates :money, presence: true, numericality: {greater_than: 0.00}

  accepts_nested_attributes_for :act_jobs, allow_destroy: true, 
                reject_if: proc { |a| (a['square'].blank? || 
                                       a['line_id'] == '1')}
end
