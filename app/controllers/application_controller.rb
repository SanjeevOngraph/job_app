class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  #check_authorization
  # can-can problem
  #load_and_authorize_resource

  # def show
  #   @user = User.find(params[:id])
  # end

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, :alert => exception.message
  # end

protected

  protected
    def after_sign_in_path_for(resource)
      show_path
    end
    
    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
   end

end
