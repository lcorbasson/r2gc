class MeasuringEnginesController < SiteController
 

  def index
    @search = MeasuringEngine.search(params[:search])
    @tools = @search.paginate(:all,:page => params[:page], :per_page => 30, :order => "name ASC")

    @tool_type = "MeasuringEngine"
    if params[:search] && !params[:search][:laboratory_id_equals].blank?
      if !params[:search][:correspondents_search_entity_id_equals].blank?
        search_entity = SearchEntity.find(params[:search][:correspondents_search_entity_id_equals])
        @correspondents =  search_entity.correspondents
      else
        laboratory = Laboratory.find(params[:search][:laboratory_id_equals])
        @entities =  laboratory.search_entities        
        @correspondents =  @entities.collect(&:correspondents).flatten.uniq
      end
    end   
    save_tools_collection @search.map{|t| t.id}
    save_search_params params[:search]

    radiant_render :page => "/tools"
  end

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

  def save_tools_collection collection
    session[:tools_collection] = collection
  end


  def save_search_params search_params
    session[:search_params] = search_params
  end

  
end
