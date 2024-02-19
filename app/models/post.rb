class Post < ApplicationRecord
  # associations
  belongs_to :user

  # uploads
  has_one_attached :image

  # title validation
  validates :title, presence: true, length: { maximum: 100 }

  # image validation
  validate :avatar_content_type

  private

  def avatar_content_type
    if image.attached? && !image.content_type.start_with?('image/')
      image.purge # delete the uploaded file
      errors.add(:image, 'must be an image')
    end
  end
end
