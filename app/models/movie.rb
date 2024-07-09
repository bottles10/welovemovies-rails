class Movie < ApplicationRecord
  enum :rating, { pg: 0, "pg-13": 1, lv: 2, r: 3, nr:4 }
  has_rich_text :description
  validates :title, presence: true
  validates :runtime_in_minutes, presence: true
  validates :rating, presence: true

  has_one_attached :image
end
