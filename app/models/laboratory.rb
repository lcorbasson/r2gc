class Laboratory < ActiveRecord::Base

 has_many :search_entities, :dependent => :destroy
 has_many :tools

 validates_presence_of :name



end
