class Admin::ToolPublicPhotosController < ApplicationController
#  before_filter :test
  only_allow_access_to :create, :edit, :update, :new, :destroy, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'avez pas les droits."

  

  def index
 
  end

  def new
    tool_id = params[:software_id] ? params[:software_id] : params[:test_engine_id] ? params[:test_engine_id] : params[:tool_engine_id] ? params[:tool_engine_id] : params[:measuring_engine_id]
    @tool = Tool.find(tool_id)
    @asset = @tool.tool_public_photos.new
  end



  def create
    @tool = Tool.find(params[:tool_id])
    @asset = @tool.tool_public_photos.new(params[:tool_public_photo])
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
    @asset = ToolAsset.find(params[:id])
  end

  def update
    tool_id = params[:software_id] ? params[:software_id] : params[:test_engine_id] ? params[:test_engine_id] : params[:tool_engine_id] ? params[:tool_engine_id] : params[:measuring_engine_id]
    @tool = Tool.find(tool_id)
    @asset = ToolAsset.find(params[:id])
    if @asset.update_attributes(params[:tool_public_photo])
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
    tool_id = params[:software_id] ? params[:software_id] : params[:test_engine_id] ? params[:test_engine_id] : params[:tool_engine_id] ? params[:tool_engine_id] : params[:measuring_engine_id]
    @tool = Tool.find(tool_id)
    @asset = ToolAsset.find(params[:id])
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

  def test
    puts "*********************#{action_name}"
  end

end
