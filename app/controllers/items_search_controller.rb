
class ItemsSearchController < ApplicationController
  def index
    @items = Item.search_item(params[:search_word]).page(params[:page])
    respond_to do |format|
      format.html { render 'static_pages/home' }
      format.js
    end
  end
end
