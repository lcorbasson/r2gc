class ToolEnginesController < SiteController
 
  
  def show
    @tool_engine = ToolEngine.find(params[:id])
    save_tool_show @tool_engine.id

     radiant_render :page => "/tools"
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
