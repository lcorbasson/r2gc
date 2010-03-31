class Admin::MeasuringEnginesController < Admin::ResourceController
  only_allow_access_to :create, :edit, :update, :new,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'

  def index
    @tools = MeasuringEngine.all
  end

  def new
    @measuring_engine = MeasuringEngine.new
  end

  def create
    @measuring_engine = MeasuringEngine.new(params[:measuring_engine])
    if @measuring_engine.save
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_tools_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @measuring_engine = MeasuringEngine.find(params[:id])

  end

  def update
    @measuring_engine = MeasuringEngine.find(params[:id])
    if @measuring_engine.update_attributes(params[:measuring_engine])
      if params[:tools]
        params[:tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @measuring_engine,
            :tool_to => Tool.find(tool_id)
          )
        end
      end
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_tools_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end


  
end
