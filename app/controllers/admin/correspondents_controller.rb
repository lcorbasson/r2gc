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
    if User.find_by_email(params[:correspondent][:email]) && User.find_by_email(params[:correspondent][:email]).r2gc_manager?
      @correspondent = User.find_by_email(params[:correspondent][:email])
      @correspondent.roles << Role.find_by_role_name("r2gc_correspondent")
       if @correspondent.update_attributes(params[:correspondent])
  #      Notifier.deliver_send_connexion_mail_for_correspondent(@correspondent, password )
        flash[:notice] = 'Correspondant créé.'
        redirect_to admin_correspondents_path
      else
        flash[:error] = "#{@correspondent.errors.full_messages.join(",")}"
        render :action => :new
      end
    else
      @correspondent = Correspondent.new(params[:correspondent])
      @correspondent.roles << Role.find_by_role_name("r2gc_correspondent")
      @correspondent.login = @correspondent.email
      value = []
      8.times { value  << (97 + rand(25)).chr }
      password = value
      @correspondent.password = password
      @correspondent.password_confirmation = password
      if @correspondent.save
  #      Notifier.deliver_send_connexion_mail_for_correspondent(@correspondent, password )
        flash[:notice] = 'Correspondant créé.'
        redirect_to admin_correspondents_path
      else
        flash[:error] = "#{@correspondent.errors.full_messages.join(",")}"
        render :action => :new
      end
    end
    
  end

  def update
    @correspondent = Correspondent.find(params[:id]) 
    if @correspondent.update_attributes(params[:correspondent])
      flash[:notice] = 'Correspondant mis à jour.'
      redirect_to admin_correspondents_path
    else
      flash[:error] = "Une erreur s'est produite."
      redirect_to new_admin_correspondent_path
    end
  end

  def edit
    @correspondent = Correspondent.find(params[:id])
  end

  def destroy
    @correspondent = Correspondent.find(params[:id])
    roles = @correspondent.roles
    roles.delete(Role.find_by_role_name("r2gc_correspondent"))
    
    if @correspondent.update_attribute(:roles, roles)
      flash[:notice] = 'Correspondent supprimé.'
      redirect_to admin_correspondents_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to admin_correspondents_path()
    end
  end


  
end
