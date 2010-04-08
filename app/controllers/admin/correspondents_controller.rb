class Admin::CorrespondentsController < ApplicationController
  only_allow_access_to :index, :new, :edit,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'Vous devez être Modérateur pour accéder à cette ressource.'
 
  
  def index
    @correspondents = Correspondent.find(:all, :include => :roles, :conditions => ["#{Role.table_name}.role_name = ?", "r2gc_correspondent"])
  end

  def new
    @correspondent = Correspondent.new
    @correspondent.roles << Role.find_by_role_name("r2gc_correspondent")
  end

  def create
    @correspondent = Correspondent.new(params[:correspondent])
    @correspondent.roles << Role.find_by_role_name("r2gc_correspondent")
    if @correspondent.save
      flash[:notice] = 'Correspondant créé.'
      redirect_to admin_correspondents_path
    else
      flash[:error] = "Une erreur s'est produite."
      redirect_to new_admin_correspondent_path
    end
  end

  def edit
    @correspondent = Correspondent.find(params[:id])
  end


  
end
