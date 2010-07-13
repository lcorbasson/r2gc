class ToolsController < SiteController
 no_login_required
 require 'csv'
  
  def index
    @search = Tool.search(params[:search])
    @tools = @search.paginate(:all, :page => params[:page], :per_page => 30, :order => "tools.name ASC")
    @export_tools = @search.paginate(:all,:page => 1, :per_page => @tools.total_pages*30>0 ? @tools.total_pages*30 : 1 , :order => "tools.name ASC")
   
    @tool_type = ""
     if params[:search] && !params[:search][:laboratory_id_equals].blank?
      if !params[:search][:correspondents_search_entity_id_equals].blank?
        search_entity = SearchEntity.find(params[:search][:correspondents_search_entity_id_equals])
        @correspondents =  search_entity.correspondents
      else
        laboratory = Laboratory.find(params[:search][:laboratory_id_equals])
        @entities =  laboratory.search_entities
        @correspondents =  @entities.collect(&:correspondents).flatten.uniq
      end
    end
   
    save_tools_collection @tools.map{|t| t.id}
    save_search_params params[:search]

    respond_to do |format|
      format.html { radiant_render :page => "/tools" }
      format.csv  { send_data(tools_to_csv.read, :type => 'text/csv; header=present', :filename => 'equipements.csv') }
    end
    
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
    if !params[:email].blank? && !params[:last_name].blank? && !params[:first_name].blank? && !params[:message].blank?
      tool = Tool.find(params[:tool_id])      
      tool.main_correspondent.blank? ? correspondents = tool.correspondents.collect(&:email) : correspondents = tool.main_correspondent.email
      Notifier.deliver_send_informations_mail(correspondents, params[:email], "#{params[:last_name]} #{params[:first_name]}", tool.name, params[:message] )
      render :update do |page|
        page.replace_html ".tool_show_mail", "<span class='notice_message'>Votre demande d’information a bien été envoyée.</span>"
      end
    else
      render :update do |page|
        page.replace_html :bad_flash_message, 'Veuillez remplir les champs obligatoires(*).'
      end
    end
  end

  def forgot_password
    radiant_render :page => "/tools"
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    if @user
      value = ''
      8.times { value  << (97 + rand(25)).chr }
      value
      @user.password = value
      @user.password_confirmation = @user.password
      if @user.save
        Notifier.deliver_password_reset_instructions(@user,value)
        render :update do |page|          
          page.redirect_to tools_path
          page << "jQuery('#general_good_flash_message').show();"
          page.replace_html :general_good_flash_message, "Un email de confirmation a été envoyé à l'adresse #{@user.email}"
        end
      else
        render :update do |page|
          page << "jQuery('#general_bad_flash_message').show();"
         page.replace_html :general_bad_flash_message, "Une erreur s'est produite lors de la réinitialisation de votre mot de passe."
        end
      end
    else
      render :update do |page|
        page << "jQuery('#general_bad_flash_message').show();"
        page.replace_html :general_bad_flash_message, "Adresse email introuvable"
      end
    end
  end

  def edit_password
    
  end

  def update_password
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      render :update do |page|
        page.replace_html :general_good_flash_message, "Votre mot de passe a été réinitialisé."
        page.redirect tools_path
      end
    else
      render :update do |page|
        page.replace_html :general_good_flash_message, "Une erreur s'est produite lors de la réinitialisation de votre mot de passe."
      end
    end
  end

  private

  def save_tools_collection collection
    session[:tools_collection] = collection
  end

  def save_tool_show tool_id
    session[:tool_show] = tool_id
  end

  def save_search_params search_params
    session[:search_params] = search_params
  end

  def tools_to_csv
    
    ic = Iconv.new("windows-1252", "UTF-8")
    export = StringIO.new
    CSV::Writer.generate(export, ";") do |csv|
      headers = ["Laboratoire", "Nom", "Sous-type", "Marque/Constructeur", "Modèle/Version"]
      csv << headers.collect {|c| begin; ic.iconv(c.to_s); rescue; c.to_s; end }
      @export_tools.each do |tool|
        fields = [tool.laboratory, tool.name, tool.tool_subtype, tool.brand, tool.version]
        csv << fields.collect {|c| begin; ic.iconv(c.to_s); rescue; c.to_s; end }
      end
    end
    export.rewind
    export
  end
  
end
