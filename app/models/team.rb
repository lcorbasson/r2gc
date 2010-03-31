class Team < ActiveRecord::Base

  has_many :correspondents
  belongs_to :organism

  def to_s
    name
  end
  
end
