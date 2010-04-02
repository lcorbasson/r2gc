class SoftwaresController < SiteController
 
  
  def show
    @software = Software.find(params[:id])

     radiant_render :page => "/tools"
  end

end
