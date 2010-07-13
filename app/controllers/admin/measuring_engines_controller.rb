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
      if params[:measuring_engine][:main_correspondent_id]
        existing_relation = CorrespondentTool.find(:first,
          :conditions => { :tool_id => @measuring_engine.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:measuring_engine][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @measuring_engine,
            :correspondent_id => params[:measuring_engine][:main_correspondent_id],
            :main => true
          )
        end
      end

      @measuring_engine.secondary_correspondent_tools.delete_all
      if params[:measuring_engine][:secondary_correspondent_ids] && params[:measuring_engine][:secondary_correspondent_ids].size>0
        params[:measuring_engine][:secondary_correspondent_ids].each do |correspondent_id|

          CorrespondentTool.create!(
            :tool => @measuring_engine,
            :correspondent_id => correspondent_id,
            :main => false
          ) unless correspondent_id.blank?
        end
      end
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
      if params[:measuring_engine][:main_correspondent_id]
        existing_relation = CorrespondentTool.find(:first,
          :conditions => { :tool_id => @measuring_engine.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:measuring_engine][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @measuring_engine,
            :correspondent_id => params[:measuring_engine][:main_correspondent_id],
            :main => true
          )
        end
      end
      @measuring_engine.secondary_correspondent_tools.delete_all
      if params[:measuring_engine][:secondary_correspondent_ids] && params[:measuring_engine][:secondary_correspondent_ids].size>0
        params[:measuring_engine][:secondary_correspondent_ids].each do |correspondent_id|
          CorrespondentTool.create!(
            :tool => @measuring_engine,
            :correspondent_id => correspondent_id,
            :main => false
          ) unless correspondent_id.blank?
        end
      end
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

   def update_tools
    @laboratory = Laboratory.find(params[:laboratory_id]) if !params[:laboratory_id].blank?
    @measuring_engine = MeasuringEngine.find(params[:tool_id]) if !params[:tool_id].blank?
    render :update do |page|
      page.replace_html :linked_tools, :partial => "admin/measuring_engines/select_linked_tools"
      page.replace_html :correspondents, :partial => "admin/measuring_engines/select_correspondents"
      page.replace_html :main_correspondent, :partial => "admin/measuring_engines/select_main_correspondent"
    end
  end


  
end
