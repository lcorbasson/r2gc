class TestEnginesController < SiteController
 
  
 def show
    @test_engine = TestEngine.find(params[:id])

     radiant_render :page => "/tools"
  end

  
end
