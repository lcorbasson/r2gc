class ToolAsset < ActiveRecord::Base

  has_attached_file :asset,
    :path => ":rails_root/public/system/:class/:attachment/:id/:style_:basename.:extension",
    :url => '/system/:class/:attachment/:id/:style_:basename.:extension',
    :styles => { :lightbox => "500x500>",:profile => "300x300>", :thumb => "100x100>" }
  
  belongs_to :tool

  
  validates_presence_of :tool, :asset

  # paperclip fails on thumbnail processing if the asset is not an image
  before_post_process :asset_image?

   def asset_image?
    case asset_content_type
    when /jp(e)?g/i, /png/i, /gif/i, /bmp/i, /image/i
      true
    else
      false
    end
  end

end
