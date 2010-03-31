class Correspondent < User
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :tools

  def to_s
    name
  end
end
