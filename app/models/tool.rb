class Tool < ActiveRecord::Base

  has_and_belongs_to_many :use_conditions
  has_and_belongs_to_many :software_statuses
  has_and_belongs_to_many :software_application_domains



  has_many :relations_from, :class_name => 'ToolRelation', :foreign_key => 'tool_from_id', :dependent => :delete_all
  has_many :relations_to, :class_name => 'ToolRelation', :foreign_key => 'tool_to_id', :dependent => :delete_all
  has_and_belongs_to_many :correspondents
  has_many :tool_assets, :dependent => :destroy
  has_many :tool_brochures, :dependent => :destroy
  has_many :tool_public_photos, :dependent => :destroy
  has_many :tool_private_photos, :dependent => :destroy
  has_many :tool_schemas, :dependent => :destroy
 

  belongs_to :tool_subtype
  belongs_to :laboratory

  named_scope :limit, lambda {|count| { :limit => count } }

  validates_presence_of :name

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
