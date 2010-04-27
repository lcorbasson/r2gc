class TestEnginesController < SiteController
 
  
 def show
    @test_engine = TestEngine.find(params[:id])
    save_tool_show @test_engine.id

    respond_to do |format|
      format.html { radiant_render :page => "/tools"}
      format.pdf  { }
    end
  end

 private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
