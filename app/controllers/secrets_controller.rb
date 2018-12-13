class SecretsController < ApplicationController
  def index
    unless session[:current_user_id] && session[:current_password]
      redirect_to login_path
    end
  end
end