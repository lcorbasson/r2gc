class ToolsController < SiteController
 no_login_required
  
  def index   
    radiant_render :page => "/tools"
  end
end
