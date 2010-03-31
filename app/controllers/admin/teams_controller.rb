class Admin::TeamsController < Admin::ResourceController
  only_allow_access_to :index, :new, :edit,
    :when => [:admin, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'Vous devez être Modérateur pour accéder à cette ressource.'
 
  
  def index
    @teams = Team.find(:all)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      flash[:notice] = 'Equipe créée.'
      redirect_to admin_teams_path
    else
      flash[:error] = "Une erreur s'est produite."
      redirect_to new_admin_team_path
    end
  end

  def edit
    @team = Team.find(params[:id])
  end


  
end
