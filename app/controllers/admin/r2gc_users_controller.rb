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
    @r2gc_user.login = @r2gc_user.email
    value = []
    8.times { value  << (97 + rand(25)).chr }
    password = value
    @r2gc_user.password = password
    @r2gc_user.password_confirmation = password
    if @r2gc_user.save
      #      Notifier.deliver_send_connexion_mail_for_correspondent(@r2gc_user, password )
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

  def destroy
    @r2gc_user = User.find(params[:id])
    if @r2gc_user.destroy
      flash[:notice] = 'Utilisateur supprimé.'
      redirect_to admin_r2gc_users_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to admin_r2gc_users_path()
    end
  end


  
end
