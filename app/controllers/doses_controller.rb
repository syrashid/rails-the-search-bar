class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @review = Review.new
    authorize @dose
    @dose.cocktail = @cocktail
    @dose.save ? (redirect_to cocktail_path(@cocktail)) : (render 'cocktails/show')
  end

  def destroy
    @dose = Dose.destroy(params[:id])
    authorize @dose
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
