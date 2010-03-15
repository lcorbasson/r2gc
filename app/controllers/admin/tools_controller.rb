class Admin::ToolsController < Admin::ResourceController
 
  
  def index
    @equipments = Tool.all
  end

  def new
    @equipment = Tool.new
  end

  def show
    
  end

  
end
