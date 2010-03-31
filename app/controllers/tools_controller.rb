class ToolsController < SiteController
 no_login_required
  
  def index
    @search = Tool.search(params[:search])
    @tools = @search.all

    
    @tool_type = params[:search][:type_equals] unless !params[:search]

    radiant_render :page => "/tools"
  end

  def show
    @tool = Tool.find(params[:id])
    radiant_render :page => "/tools"
  end
  
end
