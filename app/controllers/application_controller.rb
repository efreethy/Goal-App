class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :valid_author?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    session[:session_token] = user.reset_session_token!
  end

  def sign_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def valid_author?
    params[:id].to_i == current_user.id
  end

end
