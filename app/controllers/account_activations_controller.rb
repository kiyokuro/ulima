class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      login user
      flash[:success] = "アカウント認証が完了しました"
      redirect_to user
    else
      flash[:danger] = "アカウント認証できませんでした"
      redirect_to root_url
    end
  end
end
