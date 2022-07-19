# frozen_string_literal:true

# app/controller/users_controller.rb
class UsersController < ApplicationController
  # filters
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy

  # to use cookies method
  include ActionController::Cookies

  # get 'user/new'  new_user_path to create new user form
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  # get 'user/show'  user_path to display user details
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page],per_page: 10)
  end

  # POST '/users' to create new user
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  # GET	/users/:id/edit to edit existing user edit_user_path
  def edit; end

  # PATCH	/users/:id to update user information
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile Updated'
      redirect_to @user
    # Handle a successful update.
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  # to permit specific parameter for methods
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

 
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
