class DatabasesController < SiteController
 no_login_required
  
  def index
    @page = Page.find_by_slug("tools")
     radiant_render :page => "/tools"
  end

  def login
    if request.post?
      login = params[:login]
      password = params[:password]
      announce_invalid_user unless self.current_user == User.authenticate(login, password)
    end    
    if current_user      
      if params[:remember_me]
        current_user.remember_me
        set_session_cookie
      end
      redirect_to tools_path
      session[:return_to] = nil
    else
      redirect_to databases_url
    end
  end

  def logout
    cookies[:session_token] = { :expires => 1.day.ago }
    self.current_user.forget_me if self.current_user
    self.current_user = nil
    flash[:notice] = "Vous êtes désormais déconnecté(e)."
    redirect_to databases_url
  end

  def edit_account
    @user = User.find(params[:id])

    radiant_render :page => "/tools/account"
  end

  def update_account
    @user = User.find(params[:id])
 
      if params[:user][:password] == params[:user][:password_confirmation]
        if @user.update_attributes(params[:user])
          render :update do |page|
            page << "jQuery('#good_flash_message').show();"
            page.replace_html ".formtastic.user", "Votre mot de passe a bien été modifié."
          end
        else
          render :update do |page|
            page << "jQuery('#bad_flash_message').show();"
            page.replace_html :bad_flash_message, "Une erreur s'est produite lors de l'enregistrement."
          end
        end
      else
        render :update do |page|
          page << "jQuery('#bad_flash_message').show();"
          page.replace_html :bad_flash_message, "Le nouveau de passe ne concorde pas avec la confirmation."
        end
      end
    

    
  end

  private

  def announce_invalid_user
      flash[:error] = 'Invalid username or password.'
    end

end
