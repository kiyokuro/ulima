class ItemsController < ApplicationController
  before_action :loged_in_user, only: [:new, :create]

  def new
    @item = Item.new
    @item.pictures.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save # && Picture.create_pictures(@item)
      redirect_to root_path
    else
      @item.pictures.build
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    if @item.quantity.zero?
      render 'soldout'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :quantity, :show_enable, :show_enable, pictures_attributes: [:picture])
  end
end
