class StaticPagesController < ApplicationController
  def home
    @user = User.find_by(id: session[:user_id]) if loged_in?
    @items = Item.all.where(show_enable: true).order('created_at DESC').page(params[:page])
  end
end
