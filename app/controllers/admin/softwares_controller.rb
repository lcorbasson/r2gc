class Admin::SoftwaresController < Admin::ResourceController
 
  
  def new
    @software = Software.new
  end

  def create
    @software = Software.new(params[:software])
    if @software.save
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_tools_path()
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
      flash[:notice] = 'Logiciel enregistré.'
      redirect_to admin_tools_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  
end
