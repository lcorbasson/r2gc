class SoftwaresController < SiteController

  
  def show
    @software = Software.find(params[:id])
    save_tool_show @software.id    



    respond_to do |format|
      format.html { radiant_render :page => "/tools"}
      format.pdf  { render :layout => false}
    end
    
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

end
