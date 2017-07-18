class StaticPagesController < ApplicationController
  def home
    @user = User.find_by(id: session[:user_id]) if loged_in?
  end
end
