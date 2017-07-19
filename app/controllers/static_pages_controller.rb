class StaticPagesController < ApplicationController
  def home
    @user = User.find_by(id: session[:user_id]) if loged_in?  
    @items = Item.all.order('created_at DESC').page(params[:page])
  end
end
