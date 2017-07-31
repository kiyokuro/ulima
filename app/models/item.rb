class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: :all_blank

  def self.search_item(word)
    Item.where(['name like ?', "%#{sanitize_sql_like(word)}%"]).where(show_enable: true).order('created_at DESC')
  end
end
