class SoftwareApplicationDomain < ActiveRecord::Base
  has_many :softwares

  validates_presence_of :application_domain

end
