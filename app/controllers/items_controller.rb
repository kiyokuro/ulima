class ItemsController < ApplicationController
  before_action :loged_in_user, only: [:new, :create]
  before_action :current_user,
                def new
                  @item = Item.new
                  @item.pictures.build
                  @user = @current_user
                end

  def create
    @item = current_user.items.build(item_params)
    # binding.pry
    if @item.save # && Picture.create_pictures(@item)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :quantity, :show_enable, :show_enable, pictures_attributes: [:picture])
  end
end
