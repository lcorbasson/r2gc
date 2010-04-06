class Laboratory < ActiveRecord::Base

 has_many :search_entities, :dependent => :destroy
 has_many :tools


 has_attached_file :logo,
    :path => ":rails_root/public/system/:class/:attachment/:id/:style_:basename.:extension",
    :url => '/system/:class/:attachment/:id/:style_:basename.:extension',
    :styles => { :lightbox => "500x500>",:profile => "300x300>", :thumb => "50x50>" }



 validates_presence_of :name

  def to_s
    name
  end

end
