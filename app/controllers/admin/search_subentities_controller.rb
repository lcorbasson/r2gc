class Admin::SearchSubentitiesController < ApplicationController
  only_allow_access_to :create, :edit, :update, :new, :destroy, :index,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'êtes pas autorisé à visualiser cette ressource."

  def index
    @search_subentities = SearchSubentity.all
  end

  def new
     if SearchEntity.count>0
        @search_subentity = SearchSubentity.new
     else
       flash[:error] = "Vous devez d'abord créer des entités de recherche pour pouvoir créer des sous entités."
        redirect_to admin_search_subentities_path()
     end
  end

  def create  
      @search_subentity = SearchSubentity.new(params[:search_subentity])
      if @search_subentity.save
        if params[:correspondents]
          params[:correspondents].each do |user_id|
            correspondent = Correspondent.find(user_id)
            correspondent.update_attribute(:search_subentity,@search_subentity      )
          end
        end
        flash[:notice] = 'Sous entité enregistrée.'
        redirect_to admin_search_subentities_path()
    else
      flash[:error] = "Vous devez d'avord créer des entités de recherche pour créer des sous entités."
      redirect_to :back
    end
  end

  def edit
    @search_subentity = SearchSubentity.find(params[:id])
    @correspondents = @search_subentity.correspondents
  end

  def update
    @search_subentity = SearchSubentity.find(params[:id])
    if @search_subentity.update_attributes(params[:search_subentity])
     if params[:correspondents]
        params[:correspondents].each do |user_id|
          correspondent = Correspondent.find(user_id)
          correspondent.update_attribute(:search_subentity,@search_subentity)
        end
      end
      flash[:notice] = 'Sous entité enregistrée.'
      redirect_to admin_search_subentities_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @search_subentity = SearchSubentity.find(params[:id])
    if @search_subentity.destroy
      flash[:notice] = 'Sous entité supprimée.'
      redirect_to admin_search_subentities_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

end
