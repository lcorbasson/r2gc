class SoftwaresController < SiteController


  def index
    @search = Tool.search(params[:search])
    @tools = @search.paginate(:all,:page => params[:page], :per_page => 30, :order => "name ASC")

    @tool_type = "Software"
    save_tools_collection @search.map{|t| t.id}
    save_search_params params[:search]

    radiant_render :page => "/tools"
  end

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

  def save_tools_collection collection
    session[:tools_collection] = collection
  end


  def save_search_params search_params
    session[:search_params] = search_params
  end

end
