class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def loged_in_user
    return if loged_in?
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end
  def current_user_instanse
    @user = current_user
  end
end
