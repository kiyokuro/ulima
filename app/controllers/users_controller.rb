class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:info] = "アカウントの作成に成功しました。"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :slack_id, :password,
                                 :password_confirmation)
  end
end
