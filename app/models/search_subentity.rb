class SearchSubentity < ActiveRecord::Base

  has_many :correspondents
  belongs_to :search_entity

  validates_presence_of :name,:search_entity


  before_destroy do |search_subentity|
    search_subentity.correspondents.update_all("search_entity_id = NULL")
  end

  def to_s
    name
  end

end
