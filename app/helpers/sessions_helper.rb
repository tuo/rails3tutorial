module SessionsHelper
  def sign_in(user)
    # cookies.permanent[:remember_token] = {
    #     value: user.remember_token,
    #     expires: 20.years.from_now.utc      
    # }
    #rails built-in 'permanent' to set expiring date to 20 years
    #Under the hood, using permanent causes Rails to set the expiration to 20.years.from_now automatically.
    cookies.permanent[:remember_token] = user.remember_token
    #current_user is accessiable from view and controller
    self.current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])    
  end
  
  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end
  
end
