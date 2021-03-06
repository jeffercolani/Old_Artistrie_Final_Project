class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?

  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery
  end

  protected
  def after_sign_in_path_for(resource_or_scope)
    @user = current_user
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:user_type, :username)
  end

  protect_from_forgery with: :exception

  def contact
    @user = current_user
  end

end
