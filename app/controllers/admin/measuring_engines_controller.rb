class Admin::MeasuringEnginesController < ApplicationController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'

  def index
    @search = MeasuringEngine.search(params[:search])
    @tools = @search.paginate(:all,:page => params[:page], :per_page => 5000, :order => "name ASC")
    
  end

  def new
    @measuring_engine = MeasuringEngine.new
  end

  def create
    @measuring_engine = MeasuringEngine.new(params[:measuring_engine])
    if @measuring_engine.save
      if params[:measuring_engine][:linked_tools]
        params[:measuring_engine][:linked_tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @measuring_engine,
            :tool_to => Tool.find(tool_id)
          )
        end
      end
      flash[:notice] = 'Moyen de mesure enregistré.'
      redirect_to admin_measuring_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      render :action => :new
    end
  end

  def edit
    @measuring_engine = MeasuringEngine.find(params[:id])

  end

  def update
    @measuring_engine = MeasuringEngine.find(params[:id])
    if @measuring_engine.update_attributes(params[:measuring_engine])
      @measuring_engine.relations_from.delete_all
      @measuring_engine.relations_to.delete_all
      if params[:measuring_engine][:linked_tools]
        params[:measuring_engine][:linked_tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @measuring_engine,
            :tool_to => Tool.find(tool_id)
          )
        end
      end
      flash[:notice] = 'Moyen de mesure enregistré.'
      redirect_to admin_measuring_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

   def destroy
    @measuring_engine = MeasuringEngine.find(params[:id])
    if @measuring_engine.destroy
      flash[:notice] = 'Moyen de mesure supprimé.'
      redirect_to admin_measuring_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end


  
end
