class Admin::R2gcManagersController < ApplicationController
    only_allow_access_to :index, :new, :edit,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'Vous devez être Modérateur pour accéder à cette ressource.'


  def index
    @r2gc_managers = R2gcManager.find(:all, :include => :roles, :conditions => ["#{Role.table_name}.role_name = ?", "r2gc_manager"])
  end

  def new
    @r2gc_manager = R2gcManager.new
    @r2gc_manager.roles << Role.find_by_role_name("r2gc_manager")
  end

  def create
    @r2gc_manager = R2gcManager.new(params[:r2gc_manager])
    @r2gc_manager.roles << Role.find_by_role_name("r2gc_manager")
    if @r2gc_manager.save
      flash[:notice] = 'Modérateur R2GC créé.'
      redirect_to admin_r2gc_managers_path
    else
      flash[:error] = "Une erreur s'est produite."
      redirect_to new_admin_r2gc_manager_path
    end
  end

  def update
    @r2gc_manager = R2gcManager.find(params[:id])
    if @r2gc_manager.update_attributes(params[:r2gc_manager])
      flash[:notice] = 'Modérateur R2GC mis à jour.'
      redirect_to admin_r2gc_managers_path
    else
      flash[:error] = "Une erreur s'est produite."
      redirect_to new_admin_r2gc_manager_path
    end
  end

  def edit
    @r2gc_manager = User.find(params[:id])
  end

end
