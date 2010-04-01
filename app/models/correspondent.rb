class Correspondent < User
  
  has_and_belongs_to_many :tools

  belongs_to :search_entity
  belongs_to :search_subentity

  

  def to_s
    name
  end
end
