class Admin::TestEnginesController < ApplicationController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'
 

  def index
    @tools = TestEngine.all(:order => "name")
  end

  def new
    @test_engine = TestEngine.new
  end

  def create
    @test_engine = TestEngine.new(params[:test_engine])
    if @test_engine.save
      if params[:tools]
        params[:tools].each do |tool_id|
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

  def edit
    @test_engine = TestEngine.find(params[:id])
  end

  def update
    @test_engine = TestEngine.find(params[:id])
    if @test_engine.update_attributes(params[:test_engine])
      if params[:tools]
        params[:tools].each do |tool_id|
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


  
end
