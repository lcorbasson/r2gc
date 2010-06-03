class ToolPrivatePhotosController < SiteController
 

    def download
      head(:bad_request) and return unless params[:id]
      photo = ToolPrivatePhoto.find(params[:id])
      path = photo.asset.path
  

      send_file path, :type => File.mime_type?(path), :disposition => 'inline'
    end

  
end
