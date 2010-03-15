class Admin::SoftwareApplicationDomainsController < Admin::ResourceController

  def index
    @application_domains = SoftwareApplicationDomain.all
  end

  def new
    @application_domain = SoftwareApplicationDomain.new
  end


  def create
    @application_domain = SoftwareApplicationDomain.new(params[:software_application_domain])
    if @application_domain.save
      flash[:notice] = "Domaine d'application logiciel enregistré."
      redirect_to admin_software_application_domains_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @application_domain = SoftwareApplicationDomain.find(params[:id])
  end

  def update
    @application_domain = SoftwareApplicationDomain.find(params[:id])
    if @application_domain.update_attributes(params[:software_application_domain])
      flash[:notice] = "Domaine d'application logiciel enregistré."
      redirect_to admin_software_application_domains_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @application_domain = SoftwareApplicationDomain.find(params[:id])
    if @application_domain.destroy
      flash[:notice] = "Domaine d'application logiciel supprimé."
      redirect_to admin_software_application_domains_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

end
