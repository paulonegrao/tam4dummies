class ApplicationController < ActionController::Base
 Rails.logger.level = 5
  # Incluse SSL.
#  include SslWithConfiguredPort
  # Instead of *force_ssl* we use *force_ssl_with_configured_port* that will read
  # the SSL port from the config. We added a *if* so that this will only run
  # if the *use_ssl?* method below returns true.
#  force_ssl_with_configured_port if: :use_ssl?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  force_ssl if: :ssl_configured?
    def ssl_configured?
      # Rails.env.production?
      false
    end

  protect_from_forgery with: :exception

  def authenticate_user
    redirect_to new_session_path, alert: "Please, Sign In" unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find_by_id session[:user_id] if session[:user_id]
  end
  helper_method :current_user

  def running_rpi?
    Socket.gethostname.include?("raspberrypi") ? true : false
  end
  helper_method :running_rpi?

#  private
    # This will return true if the config has *config.use_ssl = true*
#    def use_ssl?
#      Rails.application.config.try(:use_ssl).is_a?(TrueClass)
#    end

end
