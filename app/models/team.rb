class Team < ActiveRecord::Base

  has_many :correspondents
  belongs_to :organism
  
end
