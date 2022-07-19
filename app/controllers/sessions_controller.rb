# frozen_string_literal:true

# for user login and logout
class SessionsController < ApplicationController
  def new; end

  # post '/login'
  # for login by user
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # DELETE '/logout'  logout_path
  # for logout by logged in  user
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
