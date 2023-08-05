class RecipeFacade
  def self.get_recipes(country)
    response = RecipeService.get_recipes_by_country(country)
    recipes = response[:hits].first(10).map { |hit| hit[:recipe]}
    recipes.map do |recipe|
      Recipe.new(recipe.merge(country: country))
    end
  end
end