# frozen_string_literal:true

class Micropost < ApplicationRecord
  belongs_to :user # each post belongs to a user
  has_one_attached :image # for image
  # order by new to old posts ,lambda function
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: %i[png jpg jpeg],
                    size: { less_than: 5.megabytes,
                            message: 'should be less than 5MB' }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
