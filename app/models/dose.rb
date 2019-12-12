class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  # Validate an ingredient is unique per cocktail
  validates :ingredient, uniqueness: { scope: :cocktail }

  after_create :reindex_cocktail
  after_destroy :reindex_cocktail
  private

  def reindex_cocktail
    cocktail.reindex
  end
end
