require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery



  def authenticate_and_redirect!
    return true if current_user
    if request.get?
      session[:url_back] = request.fullpath
    else
      session[:url_back] = request.referer
    end
    authenticate_user!
    session[:url_back] = nil
  end


end
