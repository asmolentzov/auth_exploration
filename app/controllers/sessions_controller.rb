class SessionsController < ApplicationController
  
  def new
    if session[:current_user_id] && session[:current_password]
      user = User.authenticate(session[:current_user_id], session[:current_password])
      if user 
        redirect_to user_path(user)
      end
    end
        
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      redirect_to user_path(user)
      session[:current_user_id] = params[:email]
      session[:current_password] = params[:password]
    else
      flash[:notice] = "ACCESS DENIED Try again I guess"
      render "new"
    end
  end
end