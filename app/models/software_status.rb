class SoftwareStatus < ActiveRecord::Base

  has_and_belongs_to_many :softwares

  validates_presence_of :name

  before_destroy do |software_status|
    software_status.softwares = []
  end

  def to_s
    name
  end
end
