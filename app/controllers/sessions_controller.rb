class SessionsController < ApplicationController

  def new
end

def create
  email = params[:email]
  password = params[:password]

   user = User.find_by email: email
   if user.try(:authenticate, password)
    log_in user
    flash[:success]= "Hello #{user.first_name}"
    redirect_to user

  else
    flash.now[:alert] = " Something is wrong with your login"
    render :new
  end

end

def delete
  log_out
  flash[:notice]= "You have been logged out"
  redirect_to sign_in_path
end

end
