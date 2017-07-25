class PurchasesController < ApplicationController
  before_action :loged_in_user, only: [:create, :index]
  def create
    @item = Item.find(params[:id])
    unless @item.quantity.zero?
      quantity = @item.quantity - 1
      @item.update_attribute(:quantity, quantity)
      if @item.quantity.zero?
        @item.update_attribute(:show_enable, false)
      end
      UserMailer.notice_sell_item(current_user, @item).deliver_later
      UserMailer.notice_buy_item(current_user, @item).deliver_later
      render 'buy_success'
    else
      render 'items/soldout'
    end
  end

  def index
    redirect_to root_path
  end
end
