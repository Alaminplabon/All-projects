class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50,minimum: 3 }
  validates :description, presence: true, length: { maximum: 1000 }
end