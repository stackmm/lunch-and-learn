class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country] || CountryService.get_random_country
    recipes = RecipeFacade.get_recipes(country)
    render json: RecipeSerializer.new(recipes)
  end
end