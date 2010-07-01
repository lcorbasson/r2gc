class Admin::TestEnginesController < ApplicationController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'
 

  def index
   @search = TestEngine.search(params[:search])
    @tools = @search.paginate(:all,:page => params[:page], :per_page => 5000, :order => "name ASC")
  end

  def new
    @test_engine = TestEngine.new
  end

  def create
    @test_engine = TestEngine.new(params[:test_engine])
    if @test_engine.save
       if params[:test_engine][:main_correspondent_id]
        existing_relation = CorrespondentTool.find(:first,
          :conditions => { :tool_id => @test_engine.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:test_engine][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @test_engine,
            :correspondent_id => params[:test_engine][:main_correspondent_id],
            :main => true
          )
        end
      end
      @test_engine.secondary_correspondent_tools.delete_all
      if params[:test_engine][:secondary_correspondent_ids] && params[:test_engine][:secondary_correspondent_ids].size>0
        params[:test_engine][:secondary_correspondent_ids].each do |correspondent_id|
          CorrespondentTool.create!(
            :tool => @test_engine,
            :correspondent_id => correspondent_id,
            :main => false
          )
        end
      end



      if params[:test_engine][:linked_tools]
        params[:test_engine][:linked_tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @test_engine,
            :tool_to => Tool.find(tool_id)
          )
        end
      end
      flash[:notice] = "Moyen d'essai enregistré."
      redirect_to admin_test_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      render :action => :new
    end
  end

  def edit
    @test_engine = TestEngine.find(params[:id])
  end

  def update
    @test_engine = TestEngine.find(params[:id])
    if @test_engine.update_attributes(params[:test_engine])
       if params[:test_engine][:main_correspondent_id]
        existing_relation = CorrespondentTool.find(:first,
          :conditions => { :tool_id => @test_engine.id, :main => true })
        existing_relation.destroy if existing_relation
        unless params[:test_engine][:main_correspondent_id].blank?
          CorrespondentTool.create!(
            :tool => @test_engine,
            :correspondent_id => params[:test_engine][:main_correspondent_id],
            :main => true
          )
        end
      end
      @test_engine.secondary_correspondent_tools.delete_all
      if params[:test_engine][:secondary_correspondent_ids] && params[:test_engine][:secondary_correspondent_ids].size>0
        params[:test_engine][:secondary_correspondent_ids].each do |correspondent_id|
          CorrespondentTool.create!(
            :tool => @test_engine,
            :correspondent_id => correspondent_id,
            :main => false
          )
        end
      end
      @test_engine.relations_from.delete_all
      @test_engine.relations_to.delete_all
      if params[:test_engine][:linked_tools]
        params[:test_engine][:linked_tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @test_engine,
            :tool_to => Tool.find(tool_id)
          )
        end
      end
      flash[:notice] = "Moyen d'essai enregistré."
      redirect_to admin_test_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @test_engine = TestEngine.find(params[:id])
    if @test_engine.destroy
      flash[:notice] = "Moyen d'essai supprimé."
      redirect_to admin_test_engines_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

  def update_tools
    @laboratory = Laboratory.find(params[:laboratory_id]) if !params[:laboratory_id].blank?
     @test_engine = TestEngine.find(params[:tool_id]) if !params[:tool_id].blank?
    render :update do |page|
      page.replace_html :linked_tools, :partial => "admin/test_engines/select_linked_tools"
      page.replace_html :correspondents, :partial => "admin/test_engines/select_correspondents"
      page.replace_html :main_correspondent, :partial => "admin/test_engines/select_main_correspondent"
    end
  end


  
end
