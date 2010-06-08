class SearchEntity < ActiveRecord::Base

  has_many :correspondents
  has_many :search_subentities
  belongs_to :laboratory

  validates_presence_of :name

  before_destroy do |search_entity|
    search_entity.correspondents.update_all("search_entity_id = NULL")
    search_entity.search_subentities.each do |subentity|
      subentity.correspondents.update_all("search_entity_id = NULL")
      subentity.destroy
    end    
  end

  def to_s
    name
  end


end
