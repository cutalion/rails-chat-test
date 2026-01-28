class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_user, :current_admin, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_admin ||= Administrator.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def logged_in?
    current_user.present? || current_admin.present?
  end

  def require_user
    unless current_user
      redirect_to login_path, alert: "Please log in to continue"
    end
  end

  def require_admin
    unless current_admin
      redirect_to admin_login_path, alert: "Please log in as admin to continue"
    end
  end
end
