class Admin::UseConditionsController < Admin::ResourceController

  def index
    @tools_use_conditions = UseCondition.find(:all, :conditions => {:tool_type => "tool"})
    @test_and_measure_use_conditions = UseCondition.find(:all, :conditions => {:tool_type => "other"})
  end

  def new
    @use_condition = UseCondition.new(:tool_type => params[:tool_type])
  end
 

  def create
    @use_condition = UseCondition.new(params[:use_condition])
    if @use_condition.save
      flash[:notice] = 'Condition enregistrée.'
      redirect_to admin_use_conditions_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def edit
    @use_condition = UseCondition.find(params[:id])
  end

  def update
    @use_condition = UseCondition.find(params[:id])
    if @use_condition.update_attributes(params[:use_condition])
      flash[:notice] = 'Condition enregistré.'
      redirect_to admin_use_conditions_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

  def destroy
    @use_condition = UseCondition.find(params[:id])
    if @use_condition.destroy
      flash[:notice] = 'Condition supprimée.'
      redirect_to admin_use_conditions_path()
    else
      flash[:error] = "Une erreur s'est produite lors de l'enregistrement."
      redirect_to :back
    end
  end

end
