class Admin::ToolEnginesController < Admin::ResourceController
  only_allow_access_to :index, :new,
    :when => [:admin, :r2gc_correspondent, :r2gc_manager],
    :denied_url => { :controller => 'admin/pages', :action => 'index' },
    :denied_message => 'You must have designer privileges to perform this action.'
 
  
  def index
    @tools = ToolEngine.all
  end

  def new
    @tool_engine = ToolEngine.new
  end

  
end
