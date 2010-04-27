class ToolEnginesController < SiteController
 
  
  def show
    @tool_engine = ToolEngine.find(params[:id])
    save_tool_show @tool_engine.id

   radiant_render :page => "/tools"
  end
 
  def to_pdf
    @tool_engine = ToolEngine.find(params[:id])
    prawnto :filename =>  "#{@tool_engine.name}.pdf", :inline => false, :template => "to_pdf.pdf.prawn"
  end


  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
