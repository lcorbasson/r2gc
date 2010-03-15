class Admin::SoftwareStatusesController < Admin::ResourceController

   def index
    @statuses = SoftwareStatus.all
  end

  def new
    @status = SoftwareStatus.new
  end


  def create
    @status = SoftwareStatus.new(params[:software_status])
    if @status.save
      flash[:notice] = "Statut logiciel enregistré."
      redirect_to admin_software_statuses_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @status = SoftwareStatus.find(params[:id])
  end

  def update
    @status = SoftwareStatus.find(params[:id])
    if @status.update_attributes(params[:software_status])
      flash[:notice] = "Statut logiciel enregistré."
      redirect_to admin_software_statuses_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @status = SoftwareStatus.find(params[:id])
    if @status.destroy
      flash[:notice] = "Statut logiciel supprimé."
      redirect_to admin_software_statuses_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end


end
