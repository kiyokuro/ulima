class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
