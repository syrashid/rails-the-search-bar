class Review < ApplicationRecord
  after_create :update_average

  belongs_to :cocktail
  validates :text, presence: true
  validates :rating, presence: true, inclusion: { in: (1..5) }

  def update_average
    total_number = cocktail.reviews.count
    reviews_sum = cocktail.reviews.sum(:rating)
    cocktail.avg_reviews = reviews_sum / total_number.to_f
    cocktail.save
  end
end
