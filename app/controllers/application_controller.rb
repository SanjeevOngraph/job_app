class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  #check_authorization
  # can-can problem
  #load_and_authorize_resource

  def show
    # @article is already loaded and authorized
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
