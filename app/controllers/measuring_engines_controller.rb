class MeasuringEnginesController < SiteController
 
  
  def index
    @softwares = Tool.all
  end

  
end
