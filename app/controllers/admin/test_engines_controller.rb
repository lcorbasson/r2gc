class Admin::TestEnginesController < Admin::ResourceController
 
  
  def index
    @equipments = TestEngine.all
  end

  
end
