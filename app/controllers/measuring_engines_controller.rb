class MeasuringEnginesController < SiteController
 
  
  def show
    @measuring_engine = MeasuringEngine.find(params[:id])
    save_tool_show @measuring_engine.id

    respond_to do |format|
      format.html { radiant_render :page => "/tools"}
      format.pdf  { prawnto :filename =>  "#{@measuring_engine.name}.pdf", :inline => false, :template => "show.prawn.pdf"
      }
    end
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
