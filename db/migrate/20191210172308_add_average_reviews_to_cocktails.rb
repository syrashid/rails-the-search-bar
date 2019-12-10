class AddAverageReviewsToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :avg_reviews, :float, default: 0
  end
end
