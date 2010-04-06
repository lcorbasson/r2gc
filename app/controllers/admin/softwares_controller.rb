class Admin::SoftwaresController < Admin::ResourceController
  only_allow_access_to :create, :edit, :update, :new, :index,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'avez pas les droits."
 

  def index
     @tools = Software.all
  end

  def show
    @software = Software.find(params[:id])
  end

  def new
    @software = Software.new
  end

  def create
    @software = Software.new(params[:software])
    if @software.save
      if params[:tools]
        params[:tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @software,
            :tool_to => Tool.find(tool_id)
          )
        end
      end   
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_softwares_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @software = Software.find(params[:id]) 
    
  end

  def update
    @software = Software.find(params[:id])
    if @software.update_attributes(params[:software])     
      if params[:tools]
        params[:tools].each do |tool_id|
          ToolRelation.create!(
            :tool_from => @software,
            :tool_to => Tool.find(tool_id)
          )
        end
      end     
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_softwares_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end


  def destroy
    @software = Software.find(params[:id])
    if @software.destroy
      flash[:notice] = 'Logiciel supprimé.'
      redirect_to admin_softwares_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

  
end
