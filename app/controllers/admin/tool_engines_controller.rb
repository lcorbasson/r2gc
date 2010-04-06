class Admin::ToolEnginesController < Admin::ResourceController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'
 
  
 def index
     @tools = ToolEngine.all
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
       if params[:tools]
        params[:tools].each do |tool_id|
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

  def edit
    @tool_engine = ToolEngine.find(params[:id])

  end

  def update
    @tool_engine = ToolEngine.find(params[:id])
    if @tool_engine.update_attributes(params[:tool_engine])
      if params[:tools]
        params[:tools].each do |tool_id|
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
