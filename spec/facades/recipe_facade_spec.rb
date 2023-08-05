require "rails_helper"

RSpec.describe RecipeFacade do
  it "returns an array of recipe objects for a country", :vcr do
    recipes = RecipeFacade.get_recipes("thailand")

    expect(recipes).to be_an(Array)
    expect(recipes.first).to be_a(Recipe)
  end
end