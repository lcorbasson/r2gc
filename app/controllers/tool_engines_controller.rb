class ToolEnginesController < SiteController
 
  
  def show
    @tool_engine = ToolEngine.find(params[:id])

     radiant_render :page => "/tools"
  end

  
end
