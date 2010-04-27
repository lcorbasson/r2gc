class ToolEnginesController < SiteController
 
  
  def show
    @tool_engine = ToolEngine.find(params[:id])
    save_tool_show @tool_engine.id

    respond_to do |format|
      format.html { radiant_render :page => "/tools"}
      format.pdf  { prawnto :filename =>  "#{@tool_engine.name}.pdf", :inline => false, :template => "show.prawn.pdf"
      }
    end
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
