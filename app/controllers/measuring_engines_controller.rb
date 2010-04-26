class MeasuringEnginesController < SiteController
 
  
  def show
    @measuring_engine = MeasuringEngine.find(params[:id])
    save_tool_show @measuring_engine.id

     radiant_render :page => "/tools"
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
