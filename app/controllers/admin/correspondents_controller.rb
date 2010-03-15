class Admin::CorrespondentsController < Admin::ResourceController
 
  
  def index
    @correspondents = Correspondent.all
  end

  def new
    @correspondent = Correspondent.new
  end

  def edit
    @correspondent = Correspondent.find(params[:id])
  end


  
end
