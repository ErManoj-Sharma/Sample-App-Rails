# frozen_string_literal:true

# app/controller/application_controller.rb
class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  # to check user is logged in or not,if not then show error message
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in !'
      redirect_to login_url
    end
  end
end
