class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktail/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:text, :rating)
  end
end
