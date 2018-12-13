class UsersController < ApplicationController
  
  def show
    visiting_user = User.find_by(email: session[:current_user_id])
    unless visiting_user == User.find(params[:id])
      redirect_to user_path(visiting_user)
    end
    @user = visiting_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = user_params[:email]
      session[:current_password] = user_params[:password]
      redirect_to user_path(@user)
    else
      flash[:notice] = "Please fill out all the fields! Email address must be unique."
      render "new"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end