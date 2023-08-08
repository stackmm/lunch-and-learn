require "rails_helper"

RSpec.describe RecipeFacade do
  it "returns an array of recipe objects for a specific country", :vcr do
    recipes = RecipeFacade.get_recipes("Thailand")

    expect(recipes).to be_an(Array)
    expect(recipes.first).to be_a(Recipe)
  end

  it "returns an empty array if no country entered", :vcr do
    recipes = RecipeFacade.get_recipes(nil)
    expect(recipes).to eq([])
  end

  it "returns an empty array if no recipes are found for an existing country", :vcr do
    recipes = RecipeFacade.get_recipes("Tuvalu")
    expect(recipes).to eq([])
  end

  it "returns an error if the country is invalid", :vcr do
    recipes = RecipeFacade.get_recipes("er3232")
    expect(recipes).to eq({ error: "Invalid country" })
  end
end