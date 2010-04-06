class ToolsController < SiteController
 no_login_required
  
  def index
    @search = Tool.search(params[:search])
    @tools = @search.paginate(:all,:page => params[:page], :per_page => 30, :order => "name ASC")
    
    @tool_type = params[:search][:type_equals] unless !params[:search]

    radiant_render :page => "/tools"
  end

  def show
    @tool = Tool.find(params[:id])
    radiant_render :page => "/tools"
  end


  def get_information
    @tool = Tool.find(params[:tool_id])
    radiant_render :page => "/tools"

  end

  def send_informations_mail
    if params[:email] && params[:last_name] && params[:first_name] && params[:message]
      ApplicationNotifier.deliver_send_informations_mail(params[:email], "#{params[:last_name]} #{params[:first_name]}", tool.name, params[:message] )
      flash[:notice] = 'Votre message a bien été transmis.'
      redirect_to :back
    else
      flash[:error] = 'Veuillez remplir les champs obligatoires(*).'
      redirect_to :back
    end
  end
  
end
