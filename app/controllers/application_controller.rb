class ApplicationController < ActionController::Base
  include Authentication
  

  allow_browser versions: :modern
  stale_when_importmap_changes

  private

  def after_authentication_url
    root_path
    # もしくは
    # board_messages_path
  end

  def require_login
    redirect_to new_session_path unless Current.user
  end
  
end
