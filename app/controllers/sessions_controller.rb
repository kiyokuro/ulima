class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        login user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or root_path
      else
        message = "アカウントが認証されていません。 "
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードに誤りがあります'
      render 'new'
    end
  end

  def destroy
    logout if loged_in?
    redirect_to(root_path)
  end
end
