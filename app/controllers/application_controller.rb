class ApplicationController < ActionController::Base
  before_filter :require_login  
  protect_from_forgery

  def not_authenticated
    redirect_to login_url, :alert => "Not authorized!"
  end

end
