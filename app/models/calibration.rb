class Calibration < ActiveRecord::Base

  has_many :tools

  validates_presence_of :calibration

end
