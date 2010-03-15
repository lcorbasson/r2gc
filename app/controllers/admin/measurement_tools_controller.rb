class Admin::MeasurementToolsController < Admin::ResourceController
 
  
  def index
    @softwares = Tool.all
  end

  
end
