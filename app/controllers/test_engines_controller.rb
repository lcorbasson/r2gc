class TestEnginesController < SiteController
 
  
 def show
    @test_engine = TestEngine.find(params[:id])
    save_tool_show @test_engine.id

     radiant_render :page => "/tools"
  end

 private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
