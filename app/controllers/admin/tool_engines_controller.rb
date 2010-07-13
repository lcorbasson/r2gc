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
      if params[:tool_engine][:main_correspondent_id]
        existing_relation = CorrespondentTool.find(:first,
          :conditions => { :tool_id => @tool_engine.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:tool_engine][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @tool_engine,
            :correspondent_id => params[:tool_engine][:main_correspondent_id],
            :main => true
          )
        end
      end
      @tool_engine.secondary_correspondent_tools.delete_all
      if params[:tool_engine][:secondary_correspondent_ids] && params[:tool_engine][:secondary_correspondent_ids].size>0
        params[:tool_engine][:secondary_correspondent_ids].each do |correspondent_id|
          CorrespondentTool.create!(
            :tool => @tool_engine,
            :correspondent_id => correspondent_id,
            :main => false
          ) unless correspondent_id.blank?
        end
      end

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
      if params[:tool_engine][:main_correspondent_id]
        existing_relation = CorrespondentTool.find(:first,
          :conditions => { :tool_id => @tool_engine.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:tool_engine][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @tool_engine,
            :correspondent_id => params[:tool_engine][:main_correspondent_id],
            :main => true
          )
        end
      end

      @tool_engine.secondary_correspondent_tools.delete_all
      if params[:tool_engine][:secondary_correspondent_ids] && params[:tool_engine][:secondary_correspondent_ids].size>0
        params[:tool_engine][:secondary_correspondent_ids].each do |correspondent_id|
          CorrespondentTool.create!(
            :tool => @tool_engine,
            :correspondent_id => correspondent_id,
            :main => false
          ) unless correspondent_id.blank?
        end
      end

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

  def update_tools
    @laboratory = Laboratory.find(params[:laboratory_id]) if !params[:laboratory_id].blank?
    @tool_engine = ToolEngine.find(params[:tool_id]) if !params[:tool_id].blank?
    render :update do |page|
      page.replace_html :linked_tools, :partial => "admin/tool_engines/select_linked_tools"
      page.replace_html :correspondents, :partial => "admin/tool_engines/select_correspondents"
      page.replace_html :main_correspondent, :partial => "admin/tool_engines/select_main_correspondent"
    end
  end

  
end
