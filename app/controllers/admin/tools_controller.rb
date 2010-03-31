class Admin::ToolsController < Admin::ResourceController
  only_allow_access_to :index, :show, :new,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'
 
  
  def index
    @equipments = Tool.all
  end

  def new
    @equipment = Tool.new
  end

  def show
    
  end

  
end
