# frozen_string_literal:true

# app/controller/application_controller.rb
class ApplicationController < ActionController::Base
  def hello
    render html: 'hello world'
  end
end
