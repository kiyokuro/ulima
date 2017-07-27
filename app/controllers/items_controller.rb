class ItemsController < ApplicationController
  before_action :loged_in_user, only: [:new, :create, :edit, :update]

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
  end

  def edit
    @item = Item.find(params[:id])
    if @item.pictures.none?
      @item.pictures.build
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      if @item.pictures.count > 1
        @item.pictures.first.destroy
      end
      redirect_to user_path(@item.user_id)
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :quantity, :show_enable, pictures_attributes: [:picture])
  end
end
