class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show

  end

  def new
  end

  def create
  end

  def random
    @cocktail = Cocktail.find(Cocktail.pluck(:id).sample)
    render :show
  end

  private
  
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
