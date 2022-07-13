# frozen_string_literal:true

# app/controller/users_controller.rb
class UsersController < ApplicationController
  # get 'user/new'  new_user_path to create new user form
  def new
    @user = User.new
  end

  # get 'user/show'  user_path to display user details
  def show
    @user = User.find(params[:id])
  end

  # POST '/users' to create new user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  # to permit specific parameter for methods
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
