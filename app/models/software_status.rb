class SoftwareStatus < ActiveRecord::Base

  has_and_belongs_to_many :softwares

  validates_presence_of :name
end
