class Admin::CalibrationsController < ApplicationController
  only_allow_access_to :create, :edit, :update, :index, :new, :destroy,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => "Vous n'avez pas accès à cette ressource."


  def index
    @calibrations = Calibration.all
  end

  def new
    @calibration = Calibration.new
  end

  def create
    @calibration = Calibration.new(params[:calibration])
    if @calibration.save
      flash[:notice] = 'Calibration enregistrée.'
      redirect_to admin_calibrations_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @calibration = Calibration.find(params[:id])
  end

  def update
    @calibration = Calibration.find(params[:id])
    if @calibration.update_attributes(params[:calibration])
      flash[:notice] = 'Calibration enregistrée.'
      redirect_to admin_calibrations_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @calibration = Calibration.find(params[:id])
    if @calibration.destroy
      flash[:notice] = 'Calibration supprimée.'
      redirect_to admin_calibrations_path()
    else
      flash[:error] = "Une erreur s'est produite lors de la suppression."
      redirect_to :back
    end
  end

end
