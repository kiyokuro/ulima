class PurchasesController < ApplicationController
  before_action :loged_in_user, only: [:create, :index]
  def create
    @item = Item.find(params[:id])
    quantity = @item.quantity - 1
    @item.update_attribute(:quantity, quantity)
    render 'buy_success'
  end

  def index
    redirect_to root_path
  end
end
