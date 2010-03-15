class Tool < ActiveRecord::Base


  acts_as_network :tool_relations, :join_table => :tool_relations
  has_many :tools, :through => :tool_relations

  belongs_to :tool_subtype
  belongs_to :agency

end
