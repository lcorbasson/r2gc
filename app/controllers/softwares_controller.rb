class SoftwaresController < SiteController

  
  def show
    @software = Software.find(params[:id])
    save_tool_show @software.id    

      radiant_render :page => "/tools"
    end    


  def to_pdf
    @software = Software.find(params[:id])
    prawnto :filename =>  "#{@software.name}.pdf", :inline => false, :template => "to_pdf.pdf.prawn"
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

end
