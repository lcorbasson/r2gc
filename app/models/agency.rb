class Agency < ActiveRecord::Base

  has_many :laboratories

  validates_presence_of :name
  
end
