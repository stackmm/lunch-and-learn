require "rails_helper"

RSpec.describe RecipeService do
  it "establishes a connection and obtains recipes by country", :vcr do
    recipes = RecipeService.get_recipes_by_country("thailand")

    expect(recipes).to be_a(Hash)
    expect(recipes[:count]).to eq(191)
    expect(recipes[:hits]).to be_a(Array)
    expect(recipes[:hits][0][:recipe][:label]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipes[:hits][0][:recipe][:image]).to be_a(String)
    expect(recipes[:hits][0][:recipe][:url]).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
  end
end