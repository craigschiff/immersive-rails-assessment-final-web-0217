class SessionsController < ApplicationController
skip_before_action :is_logged_in?, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to episodes_path
    else
      redirect_to login_path
    end
  end

  def destroy
    byebug
    session.clear
    redirect_to login_path
  end


end
