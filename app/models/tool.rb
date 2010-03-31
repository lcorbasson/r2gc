class Tool < ActiveRecord::Base

  has_many :tool_relations
  has_many :relations_from, :class_name => 'ToolRelation', :foreign_key => 'tool_from_id', :dependent => :delete_all
  has_many :relations_to, :class_name => 'ToolRelation', :foreign_key => 'tool_to_id', :dependent => :delete_all
  has_and_belongs_to_many :correspondents 

  belongs_to :tool_subtype
  belongs_to :agency

  def relations
    relations_from+relations_to
  end

  def teams
    correspondents.collect(&:teams).delete_if{|t| t.nil? }.join(", ")
  end

  def to_s
    name
  end
  
end
