class ToolPublicPhotosController < SiteController
 

    def download
      head(:bad_request) and return unless params[:id]      
      photo = ToolPublicPhoto.find(params[:id])
      path = photo.asset.path
  

      x_send_file path, :type => File.mime_type?(path), :disposition => 'inline'
    end

  
end
