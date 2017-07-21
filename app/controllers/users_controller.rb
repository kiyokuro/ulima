class UsersController < ApplicationController
  before_action :loged_in_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
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
