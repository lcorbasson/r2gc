class Admin::ToolEnginesController < ApplicationController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'
 
  
 def index
     @search = ToolEngine.search(params[:search])
    @tools = @search.paginate(:all,:page => params[:page], :per_page => 5000, :order => "name ASC")
  end

  def show
    @tool_engine = ToolEngine.find(params[:id])
  end

  def new
    @tool_engine = ToolEngine.new
  end

  def create
    @tool_engine = ToolEngine.new(params[:tool_engine])
    if @tool_engine.save
       if params[:tool_engine][:linked_tools]
        params[:tool_engine][:linked_tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @tool_engine,
            :tool_to => Tool.find(tool_id)
          )
        end
      end
      flash[:notice] = 'Machine outil enregistrée.'
      redirect_to admin_tool_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      render :action => :new
    end
  end

  def edit
    @tool_engine = ToolEngine.find(params[:id])

  end

  def update
    @tool_engine = ToolEngine.find(params[:id])
    if @tool_engine.update_attributes(params[:tool_engine])
      @tool_engine.relations_from.delete_all
      @tool_engine.relations_to.delete_all
      if params[:tool_engine][:linked_tools]
        params[:tool_engine][:linked_tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @tool_engine,
            :tool_to => Tool.find(tool_id)
          )
        end
      end
      flash[:notice] = 'Machine outil enregistrée.'
      redirect_to admin_tool_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @tool_engine = ToolEngine.find(params[:id])
    if @tool_engine.destroy      
      flash[:notice] = 'Machine outil supprimée.'
      redirect_to admin_tool_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

  
end
