class Correspondent < User

  has_many :correspondent_tools
  has_many :tools, :through => :correspondent_tools

  belongs_to :search_entity
  belongs_to :search_subentity

  

  def to_s
    name
  end

  def name
    "#{last_name} #{first_name}"
  end

  def name_frontend
    "#{first_name} #{last_name}"
  end
end
