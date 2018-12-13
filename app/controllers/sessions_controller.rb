class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.authenticate(params)
    if user
      redirect_to user_path(user)
    else
      render "new"
    end
  end
end