class Admin::AgenciesController < Admin::ResourceController

  def index
    @organisms = Agency.all
  end

  def new
    @organism = Agency.new
  end

  def create
    @organism = Agency.new(params[:agency])
    if @organism.save
      flash[:notice] = 'Organisme enregistré.'
      redirect_to admin_agencies_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @organism = Agency.find(params[:id])
  end

  def update
    @organism = Agency.find(params[:id])
    if @organism.update_attributes(params[:agency])
      flash[:notice] = 'Organisme enregistré.'
      redirect_to admin_agencies_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

end
