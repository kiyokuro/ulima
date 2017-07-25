class UsersController < ApplicationController
  before_action :loged_in_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "アカウント認証メールが送信されました。メールをご確認ください。"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.order('created_at DESC').page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :slack_id, :password,
                                 :password_confirmation)
  end
end
