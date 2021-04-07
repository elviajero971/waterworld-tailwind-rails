class Attraction < ApplicationRecord
  after_validation :set_slug, only: [:create,:update]
  belongs_to :category
  has_one_attached :image
  scope :published, ->{ where.not(published_at: nil)}
  scope :unpublished, ->{ where(published_at: nil)}
  def to_param
    "#{id}-#{slug}"
  end
  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
