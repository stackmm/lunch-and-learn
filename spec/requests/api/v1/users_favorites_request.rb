require "rails_helper"

RSpec.describe "Find Users Favorites API", type: :request do
  describe "GET /api/v1/favorites" do
    describe "happy path" do
      it "can find a user's favorites by API key" do
        user = User.create!(name: "Mikejones", email: "mjones@gmail.com", password: "password", password_confirmation: "password")
        favorite1 = user.favorites.create!(country: "thailand", recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html", recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        favorite2 = user.favorites.create!(country: "thailand", recipe_link: "https://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight-dinner-recipes-from-the-kitchn-123308", recipe_title: "Recipe: Egyptian Tomato Soup")

        user_params = { api_key: user.api_key }

        get "/api/v1/favorites", params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        favorites = JSON.parse(response.body, symbolize_names: true)

        expect(favorites[:data].count).to eq(2)

        favorites[:data].each do |favorite|
          expect(favorite).to have_key(:id)
          expect(favorite).to have_key(:type)
          expect(favorite[:type]).to eq("favorite")
          expect(favorite).to have_key(:attributes)
          expect(favorite[:attributes]).to have_key(:country)
          expect(favorite[:attributes]).to have_key(:recipe_link)
          expect(favorite[:attributes]).to have_key(:recipe_title)
          expect(favorite[:attributes]).to have_key(:created_at)
        end
      end
    end

    describe "sad path" do

    end
  end
end