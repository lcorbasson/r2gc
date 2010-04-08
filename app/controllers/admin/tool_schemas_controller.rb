class Admin::ToolSchemasController < Admin::ResourceController
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
    @asset = @tool.tool_schemas.new
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @asset = @tool.tool_schemas_photos.new(params[:tool_schema])
    if @asset.save
      flash[:notice] = 'Document enregistré.'
       case @tool
      when Software
        redirect_to edit_admin_software_path(@tool)
      when TestEngine
        redirect_to edit_admin_test_engine_path(@tool)
      when ToolEngine
        redirect_to edit_admin_tool_engine_path(@tool)
      when MeasuringEngine
        redirect_to edit_admin_measuring_engine_path(@tool)
      end
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    tool_id = params[:software_id] ? params[:software_id] : params[:test_engine_id] ? params[:test_engine_id] : params[:tool_engine_id] ? params[:tool_engine_id] : params[:measuring_engine_id]
    @tool = Tool.find(tool_id)
    @asset = @tool.find(params[:tool_schema_id])
  end

  def update
    @tool = Tool.find(params[:tool_id])
    @asset = @tool.find(params[:tool_schema_id])
    if @asset.update_attributes(params[:tool_schema])
      flash[:notice] = 'Document mis à jour.'
      case @tool
      when Software
        redirect_to edit_admin_software_path(@tool)
      when TestEngine
        redirect_to edit_admin_test_engine_path(@tool)
      when ToolEngine
        redirect_to edit_admin_tool_engine_path(@tool)
      when MeasuringEngine
        redirect_to edit_admin_measuring_engine_path(@tool)
      end

    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @tool = Tool.find(params[:tool_id])
    @asset = @tool.find(params[:tool_schema_id])
    if @asset.destroy
      flash[:notice] = 'Document supprimé.'
      case @tool
      when Software
        redirect_to edit_admin_software_path(@tool)
      when TestEngine
        redirect_to edit_admin_test_engine_path(@tool)
      when ToolEngine
        redirect_to edit_admin_tool_engine_path(@tool)
      when MeasuringEngine
        redirect_to edit_admin_measuring_engine_path(@tool)
      end

    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

end
