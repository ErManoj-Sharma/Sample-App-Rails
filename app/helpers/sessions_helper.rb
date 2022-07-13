# frozen_string_literal:true

# helper for session controller
module SessionsHelper
  # this method will check if session is valid.
  # then it find user by user_id and return user object to @current_user(instance variable)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # check for is user is logged in or not
  def logged_in?
    !current_user.nil?
  end

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # log out the logged in user
  def log_out
    session.delete(:user_id)
    @current_user = nil?
  end
end
