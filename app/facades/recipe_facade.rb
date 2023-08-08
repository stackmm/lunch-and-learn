class RecipeFacade
  def self.get_recipes(country)
    return [] if country.nil?
    return [] if CountryService.valid_country?(country)

    response = RecipeService.get_recipes_by_country(country)
    recipes = response[:hits].first(10).map { |hit| hit[:recipe]}

    return [] if recipes.empty?

    recipes.map do |recipe|
      Recipe.new(recipe.merge(country: country))
    end
  end
end