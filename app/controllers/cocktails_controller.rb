class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cocktails = policy_scope(Cocktail)
    # elastic_query = { fields: [:name, :ingredient_names] }
    # @cocktails = Cocktail.search(params[:query], elastic_query) if params[:query].present?
    @cocktails = Cocktail.cocktail_search(params[:query]) if params[:query].present?
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
    @review = Review.new
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    authorize @cocktail
    @cocktail.save ? (redirect_to cocktail_path(@cocktail)) : (render :new)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
