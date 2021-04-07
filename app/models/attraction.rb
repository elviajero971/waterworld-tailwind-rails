class Attraction < ApplicationRecord
  after_validation :set_slug, only: [:create,:update]
  belongs_to :category
  has_one_attached :image

  def to_param
    "#{id}-#{slug}"
  end
  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
