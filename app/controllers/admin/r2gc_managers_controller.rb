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
    if User.find_by_email(params[:r2gc_manager][:email]) && User.find_by_email(params[:r2gc_manager][:email]).r2gc_correspondent?
      @r2gc_manager = User.find_by_email(params[:r2gc_manager][:email])
      @r2gc_manager.roles << Role.find_by_role_name("r2gc_manager")
       if @r2gc_manager.update_attributes(params[:r2gc_manager])
  #      Notifier.deliver_send_connexion_mail_for_correspondent(@correspondent, password )
        flash[:notice] = 'Modérateur créé.'
        redirect_to admin_r2gc_managers_path
      else
        flash[:error] = "#{@r2gc_manager.errors.full_messages.join(",")}"
        render :action => :new
      end
    else
      @r2gc_manager = R2gcManager.new(params[:r2gc_manager])
      @r2gc_manager.roles << Role.find_by_role_name("r2gc_manager")
      @r2gc_manager.login = @r2gc_manager.email
      value = []
      8.times { value  << (97 + rand(25)).chr }
      password = value
      @r2gc_manager.password = password
      @r2gc_manager.password_confirmation = password
      if @r2gc_manager.save
  #      Notifier.deliver_send_connexion_mail_for_correspondent(@r2gc_manager, password )
        flash[:notice] = 'Modérateur R2GC créé.'
        redirect_to admin_r2gc_managers_path
      else
        flash[:error] = "#{@r2gc_manager.errors.full_messages.join(",")}"
        render :action => :new
      end
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

  def destroy
    @r2gc_manager = User.find(params[:id])
    roles = @r2gc_manager.roles
    roles.delete(Role.find_by_role_name("r2gc_manager"))
    if @r2gc_manager.update_attribute(:roles, roles)
      if @r2gc_manager.roles.empty?
        @r2gc_manager.destroy
      end
      flash[:notice] = 'Modérateur supprimé.'
      redirect_to admin_r2gc_managers_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to admin_r2gc_managers_path()
    end
  end

end
