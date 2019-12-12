class Api::V1::CocktailsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_cocktail, only: [ :show, :update ]

  def index
    @cocktails = policy_scope(Cocktail)
  end

  def show; end

  def update
    @cocktail.update(cocktail_params) ? (render :show) : (render_error)
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    authorize @cocktail
    @cocktail.save ? (render :show, status: :created) : (render_error)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def render_error
    render json: { errors: @cocktail.errors.full_messages }, status: :unprocessable_entity
  end
end
