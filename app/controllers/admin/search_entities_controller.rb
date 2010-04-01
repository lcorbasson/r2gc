class Admin::SearchEntitiesController < Admin::ResourceController
  only_allow_access_to :create, :edit, :update, :new, :destroy, :index,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'êtes pas autorisé à visualiser cette ressource."

  def index
    @search_entities = SearchEntity.all
  end

  def new
    if Laboratory.count>0
        @search_subentity = SearchSubentity.new
   else
        flash[:error] = "Vous devez d'abord créer des laboratoires pour pouvoir créer des entités de recherche."
        redirect_to admin_search_entities_path()
    end
    
  end

  def create
    @search_entity = SearchEntity.new(params[:search_entity])
    if @search_entity.save
      if params[:correspondents]
        params[:correspondents].each do |user_id|
          correspondent = Correspondent.find(user_id)
          correspondent.update_attribute(:search_entity,@search_entity)
        end
      end
      flash[:notice] = 'Entité de recherche enregistrée.'
      redirect_to admin_search_entities_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @search_entity = SearchEntity.find(params[:id])
    @correspondents = @search_entity.correspondents
  end

  def update
    @search_entity = SearchEntity.find(params[:id])
    if @search_entity.update_attributes(params[:search_entity])
       if params[:correspondents]
        params[:correspondents].each do |user_id|
          correspondent = Correspondent.find(user_id)
          correspondent.update_attribute(:search_entity,@search_entity      )
        end
      end
      flash[:notice] = 'Entité de recherche enregistrée.'
      redirect_to admin_search_entities_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @search_entity = SearchEntity.find(params[:id])
    if @search_entity.destroy
      flash[:notice] = 'Entité de recherche supprimée.'
      redirect_to admin_search_entities_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

end
