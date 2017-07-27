class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "パスワード再設定のご案内メールを送信しました"
      redirect_to root_url
    else
      flash[:danger] = "メールアドレスに誤りがあります"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      login @user
      flash[:info] = "パスワードが変更されました"
      redirect_to root_url
    else
      flash[:danger] = "パスワードが変更できませんでした"
      render 'edit'
    end
  end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
      redirect_to root_url
      flash[:danger] = "有効なユーザーではありません"
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
