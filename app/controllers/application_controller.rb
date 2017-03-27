class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :is_logged_in?


  def is_logged_in?
    if !session[:user_id]
      redirect_to login_path
      flash[:alert] = "Log IN"
    end
  end

end
