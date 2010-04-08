class Admin::ToolSubtypesController < ApplicationController
  only_allow_access_to :create, :edit, :update, :index, :new, :destroy,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'avez pas accès à cette ressource."


  def index
    @tool_subtypes = ToolSubtype.all
  end

  def new
    @tool_subtype = ToolSubtype.new
  end

  def create
    @tool_subtype = ToolSubtype.new(params[:tool_subtype])
    if @tool_subtype.save
      flash[:notice] = 'Sous type enregistré.'
      redirect_to admin_tool_subtypes_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @tool_subtype = ToolSubtype.find(params[:id])
  end

  def update
    @tool_subtype = ToolSubtype.find(params[:id])
    if @tool_subtype.update_attributes(params[:tool_subtype])
      flash[:notice] = 'Sous type enregistré.'
      redirect_to admin_tool_subtypes_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @tool_subtype = ToolSubtype.find(params[:id])
    if @tool_subtype.destroy
      flash[:notice] = 'Sous type supprimé.'
      redirect_to admin_tool_subtypes_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

end
