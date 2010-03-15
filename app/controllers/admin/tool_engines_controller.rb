class Admin::ToolEnginesController < Admin::ResourceController
 
  
  def index
    @equipments = ToolEngine.all
  end

  def new
    @tool_engine = ToolEngine.new
  end

  
end
