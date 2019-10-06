class Review < ApplicationRecord
  belongs_to :cocktail
  validates :text, presence: true
  validates :rating, presenct: true
end
