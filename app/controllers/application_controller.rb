class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers
  helper_method :current_user

  private

  def current_user
    @current_user ||= authenticate_by_session(User) || upgrade_passwordless_cookie(User)
  end

  def authenticate_user!
    return if current_user
    save_passwordless_redirect_location!(User)

    flash[:error] = 'Sorry, nicht ohne Anmeldung.'
    redirect_to '/users/sign_in'
  end
end
