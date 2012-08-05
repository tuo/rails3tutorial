class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #sign the user in and redirect to users' show page
      sign_in user
      redirect_back_or user
    else
      #create an error message and re-render the signin form
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end

  end
  
  def destroy
    flash[:success] = "You're loginned out successfully"
    sign_out
    redirect_to root_path
  end
  

end
