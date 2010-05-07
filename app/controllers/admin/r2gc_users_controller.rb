class Admin::R2gcUsersController < ApplicationController
  only_allow_access_to :index, :new, :edit,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'Vous devez être Modérateur pour accéder à cette ressource.'
 
  
  def index
    @r2gc_users = R2gcUser.find(:all, :include => :roles, :conditions => ["#{Role.table_name}.role_name = ?", "r2gc_user"])
  end

  def new
    @r2gc_user = R2gcUser.new
    @r2gc_user.roles << Role.find_by_role_name("r2gc_user")
  end

  def create
    @r2gc_user = R2gcUser.new(params[:r2gc_user])
    @r2gc_user.roles << Role.find_by_role_name("r2gc_user")
    if @r2gc_user.save
      flash[:notice] = 'Utilisateur R2GC créé.'
      redirect_to admin_r2gc_users_path
    else
      flash[:error] = "Une erreur s'est produite."
      redirect_to new_admin_r2gc_user_path
    end
  end

  def update
    @r2gc_user = R2gcUser.find(params[:id])
    if @r2gc_user.update_attributes(params[:r2gc_user])
      flash[:notice] = 'Utilisateur R2GC mis à jour.'
      redirect_to admin_r2gc_users_path
    else
      flash[:error] = "Une erreur s'est produite."
      redirect_to new_admin_r2gc_user_path
    end
  end

  def edit
    @r2gc_user = User.find(params[:id])
  end


  
end
