class Dose < ApplicationRecord
  after_create :reindex_cocktail
  after_destroy :reindex_cocktail

  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  # Validate an ingredient is unique per cocktail
  validates :ingredient, uniqueness: { scope: :cocktail }

  private

  def reindex_cocktail
    cocktail.reindex
  end
end
