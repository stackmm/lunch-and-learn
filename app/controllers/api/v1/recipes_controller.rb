class Api::V1::RecipesController < ApplicationController
  def index
    recipes = RecipeFacade.get_recipes(params[:country])
    render json: RecipeSerializer.new(recipes)
  end
end