# frozen_string_literal:true

# for user login and logout
class SessionsController < ApplicationController
  def new; end

  # post '/login'
  # for login by user
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Login Successfull'
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # DELETE '/logout'  logout_path
  # for logout by logged in  user
  def destroy
    log_out
    redirect_to root_path
  end
end
