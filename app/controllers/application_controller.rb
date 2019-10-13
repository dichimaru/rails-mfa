class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :check_mfa


  private

  def not_authenticated
    redirect_to welcome_path
  end

  def check_mfa
     if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
      redirect_to new_user_mfa_session_url
    end
  end
end
