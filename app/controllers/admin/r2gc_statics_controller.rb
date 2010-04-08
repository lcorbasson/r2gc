class Admin::R2gcStaticsController < ApplicationController
   only_allow_access_to :index, :new, :edit,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'Vous devez être Modérateur pour accéder à cette ressource.'

  def index
    @page = Page.find_by_slug("tools")
  end

  def modify_home
    @page = Page.find_by_slug("tools")
  end

  def update_home
    @page = Page.find_by_slug("tools")
    part = @page.parts.find_by_name("body")
    if part.update_attribute(:content,params[:content])
      redirect_to admin_r2gc_statics_path
      flash[:notice] = 'Page mise à jour.'
    else
      redirect_to modify_home_r2gc_statics_path
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
    end
  end

end
