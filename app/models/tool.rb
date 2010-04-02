class Tool < ActiveRecord::Base

  has_many :tool_relations, :dependent => :destroy
  has_many :relations_from, :class_name => 'ToolRelation', :foreign_key => 'tool_from_id', :dependent => :delete_all
  has_many :relations_to, :class_name => 'ToolRelation', :foreign_key => 'tool_to_id', :dependent => :delete_all
  has_and_belongs_to_many :correspondents
  has_many :tool_assets, :dependent => :destroy
  has_many :tool_brochures, :dependent => :destroy
  has_many :tool_public_photos, :dependent => :destroy
  has_many :tool_private_photos, :dependent => :destroy
  has_many :tool_schemas, :dependent => :destroy
  has_and_belongs_to_many :software_statuses
  has_and_belongs_to_many :software_application_domains

  belongs_to :tool_subtype
  belongs_to :laboratory

  named_scope :limit, lambda {|count| { :limit => count } }

  def relations
    relations_from+relations_to
  end

  def search_entities
    correspondents.collect(&:search_entity).uniq.delete_if{|e| e.nil? }.join(", ")
  end

  def search_subentities
    correspondents.collect(&:search_subentity).uniq.delete_if{|e| e.nil? }.join(", ")
  end

  def to_s
    name
  end
  
end
