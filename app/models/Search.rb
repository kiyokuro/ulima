class Search
  include ActiveModel::Model

  attr_accessor :search_word

  def search_item
    Item.where("name like ?", sanitize_sql_like("%#{:search_word}%")).where(show_enable: true).order('created_at DESC').page(params[:page])
  end
end
