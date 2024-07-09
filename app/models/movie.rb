class Movie < ApplicationRecord
  enum :rating, { pg: 0, lv: 1 }
  has_rich_text :description
  validates :title, presence: true
  validates :runtime_in_minutes, presence: true
  validates :rating, presence: true

  has_one_attached :image
end
