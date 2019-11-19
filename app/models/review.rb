class Review < ApplicationRecord
  belongs_to :cocktail
  validates :text, presence: true
  validates :rating, presence: true
end
