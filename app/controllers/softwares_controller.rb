class SoftwaresController < SiteController

  
  def show
    @software = Software.find(params[:id])
    save_tool_show @software.id    



    respond_to do |format|
      format.html { radiant_render :page => "/tools"}
      format.pdf  { prawnto :filename =>  "#{@software.name}.pdf", :inline => false, :template => "show.prawn.pdf"
      }
    end
    
  end

  private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

end
