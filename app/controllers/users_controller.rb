class UsersController < ApplicationController
  skip_before_action :require_login, only: %i(new create)
  skip_before_action :check_mfa, only: %i(new create)
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to welcome_path, success: 'ユーザー登録が完了しました。'
    else
      render :new
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :password,
      :password_confirmation
    )
  end
end
