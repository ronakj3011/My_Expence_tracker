class ApplicationController < ActionController::Base
  # Enforce user authentication for all actions by default
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Uncomment and define this method to handle modern browser compatibility
  # Note: `allow_browser` is not a standard Rails method. You need to implement it if required.
  # def allow_browser(versions: :modern)
  #   # Custom logic to check for browser compatibility (e.g., using user agent strings)
  # end

  # Customize the path after the user logs out
  def after_sign_out_path_for(resource_or_scope)
    root_path # Redirect to the homepage or any other desired path
  end

  # Customize the path after the user logs in
  def after_sign_in_path_for(resource)
    root_path # Redirect to the homepage or a dashboard after login
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
