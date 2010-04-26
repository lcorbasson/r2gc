class SoftwaresController < SiteController
 
  
  def show
    @software = Software.find(params[:id])
    save_tool_show @software.id

     radiant_render :page => "/tools"
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

end
