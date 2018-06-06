class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery


  def after_sign_in_path_for(resource_or_scope)
    if  URI.parse(request.referer).path == "/users" ||  URI.parse(request.referer).path == "/users/sign_in" || URI.parse(request.referer).path == "/users/password/edit" ||
    URI.parse(request.referer).path == "/users/password" ||
    URI.parse(request.referer).path == "/users/sign_up" ||
    URI.parse(request.referer).path == "/" ||
    URI.parse(request.referer).path == "/it/users/sign_in" ||
    URI.parse(request.referer).path == "/it/users/sign_in"
    items_path
    else
      URI.parse(request.referer).path if request.referer
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :place, :description, :dob])
    devise_parameter_sanitizer.permit(:account_update, keys:  [:username, :avatar, :place, :description, :dob])

  end




end
