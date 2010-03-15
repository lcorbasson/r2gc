class SoftwareStatus < ActiveRecord::Base

  has_many :softwares

  validates_presence_of :name
end
