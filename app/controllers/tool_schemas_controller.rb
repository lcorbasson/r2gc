class ToolSchemasController < SiteController
 

    def download
      head(:bad_request) and return unless params[:id]
      schema = ToolSchema.find(params[:id])
      path = schema.asset.path
  

      send_file path, :type => File.mime_type?(path), :disposition => 'inline'
    end

  
end
