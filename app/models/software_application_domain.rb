class SoftwareApplicationDomain < ActiveRecord::Base
  has_and_belongs_to_many :softwares

  validates_presence_of :application_domain


  before_destroy do |application_domain|
    application_domain.softwares = []
  end

  def to_s
    application_domain
  end

end
