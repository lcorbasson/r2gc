class MeasuringEnginesController < SiteController
 
  
  def show
    @measuring_engine = MeasuringEngine.find(params[:id])
    save_tool_show @measuring_engine.id

   radiant_render :page => "/tools"
  end


  def to_pdf
    @measuring_engine = MeasuringEngine.find(params[:id])
    prawnto :filename =>  "#{@measuring_engine.name}.pdf", :inline => false, :template => "to_pdf.pdf.prawn"
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
