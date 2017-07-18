class ItemsController < ApplicationController
  before_action :loged_in_user, only: [:new, :create]
  def new
    @item = Item.new
    @user = current_user
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :price, :quantity, :show_enable, :show_enable)
    end
end
