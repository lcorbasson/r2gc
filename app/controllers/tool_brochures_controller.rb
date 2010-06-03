class ToolBrochuresController < SiteController
 

    def download
      head(:bad_request) and return unless params[:id]
      brochure = ToolBrochure.find(params[:id])
      path = brochure.asset.path
  

      x_send_file path, :type => File.mime_type?(path)
    end

  
end
