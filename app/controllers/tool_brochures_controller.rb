class ToolBrochuresController < SiteController
 

    def download
      head(:bad_request) and return unless params[:id]
      brochure = ToolBrochure.find(params[:id])
      path = brochure.asset.path
  

      send_file path, :type => File.mime_type?(path), :disposition => 'inline'
    end

  
end
