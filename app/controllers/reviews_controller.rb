class ReviewsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @dose = Dose.new
    @review.cocktail = @cocktail
    authorize @review
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:text, :rating)
  end
end
