class Admin::LaboratoriesController < ApplicationController
  only_allow_access_to :create, :edit, :update, :index, :new, :destroy,
    :when => [:admin, :pgce_user, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'


  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
    @laboratory = Laboratory.new(params[:laboratory])
    if @laboratory.save
      flash[:notice] = 'Laboratoire enregistré.'
      redirect_to admin_laboratories_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @laboratory = Laboratory.find(params[:id])
  end

  def update
    @laboratory = Laboratory.find(params[:id])
    if @laboratory.update_attributes(params[:laboratory])
      flash[:notice] = 'Laboratoire enregistré.'
      redirect_to admin_laboratories_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @laboratory = Laboratory.find(params[:id])
    if @laboratory.destroy
      flash[:notice] = 'Laboratoire supprimé.'
      redirect_to admin_laboratories_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

end
