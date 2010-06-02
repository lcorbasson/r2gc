class ToolPublicPhoto < ToolAsset

  def url
   asset.url(:thumb)
  end

end
