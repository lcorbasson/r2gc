class TestEnginesController < SiteController
 
  
 def show
    @test_engine = TestEngine.find(params[:id])
    save_tool_show @test_engine.id

   radiant_render :page => "/tools"
    end
  

 def to_pdf
   @test_engine = TestEngine.find(params[:id])
    prawnto :filename =>  "#{@test_engine.name}.pdf", :inline => false, :template => "to_pdf.pdf.prawn"
  end

 private

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  
end
