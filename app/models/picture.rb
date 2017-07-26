class Picture < ApplicationRecord
  belongs_to :item
  validate :picture_size
  validates :picture, presence: true, allow_nil: true
  attr_accessor :picture
  mount_uploader :picture, PictureUploader

  def self.create_pictures(item)
    unless item[:picture].nil?
      Picture.transaction do
        item[:picture].each do |pic|
          @picture = item.pictures.build(Picture.new(picture: item[:picture]))
          return false unless @photo.save
        end
      end
    else
      return false
    end
    return true
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
