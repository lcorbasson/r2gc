class MeasuringEnginesController < SiteController
 
  
  def show
    @measuring_engine = MeasuringEngine.find(params[:id])

     radiant_render :page => "/tools"
  end

  
end
