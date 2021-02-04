class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show]
  before_action :get_ingredients, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def random
    @cocktail = Cocktail.find(Cocktail.pluck(:id).sample)
    redirect_to cocktail_path(@cocktail)
  end

  private
  
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def get_ingredients
    @ingredients = Ingredient.all
  end
end
