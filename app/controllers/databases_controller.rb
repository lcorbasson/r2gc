class DatabasesController < SiteController
 no_login_required
  
  def index
     radiant_render :page => "/tools"
  end

  def login
    if request.post?
      login = params[:login]
      password = params[:password]
      announce_invalid_user unless self.current_user = User.authenticate(login, password)
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

  private

  def announce_invalid_user
      flash[:error] = 'Invalid username or password.'
    end

end
