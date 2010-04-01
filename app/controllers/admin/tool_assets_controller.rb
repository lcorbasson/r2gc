class Admin::ToolAssetsController < Admin::ResourceController
  only_allow_access_to :create, :edit, :update, :new, :destroy, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'avez pas les droits."

  def index
    @assets = ToolAsset.all
  end

  def new
    tool_id = params[:software_id] ? params[:software_id] : params[:test_engine_id] ? params[:test_engine_id] : params[:tool_engine_id] ? params[:tool_engine_id] : params[:measuring_engine_id]
    @tool = Tool.find(tool_id)
    @asset = @tool.tool_assets.new
  end

  def create
    @tool = Tool.find(params[:tool_id])
    case params[:asset_type]
    when "public_photo"
      @asset = @tool.tool_public_photos.new(params[:tool_asset])
    when "private_photo"
      @asset = @tool.tool_private_photos.new(params[:tool_asset])
    when "brochure"
      @asset = @tool.tool_brochures.new(params[:tool_asset])
    when "schema"
      @asset = @tool.tool_schemas_photos.new(params[:tool_asset])
    end   
    if @asset.save
      flash[:notice] = 'Document enregistré.'
      redirect_to :back
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @organism = Agency.find(params[:id])
  end

  def update
    @organism = Agency.find(params[:id])
    if @organism.update_attributes(params[:agency])
      flash[:notice] = 'Organisme enregistré.'
      redirect_to admin_agencies_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

end
