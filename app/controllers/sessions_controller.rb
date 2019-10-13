class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  skip_before_action :check_mfa, except: [:destroy]

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(root_path)
    else
      render :new
    end
  end

  def destroy
    logout
    UserMfaSession.destroy
    redirect_to welcome_path
  end
end
