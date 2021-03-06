class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    require_logged_in
  end

  def current_user
    #returns the name of the current current_user
    #returns nil if nobody is logged in
    session[:name]
  end

  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless session[:name]
  end
end
