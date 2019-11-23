class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @review = Review.new
    @dose = Dose.new
  end
end
