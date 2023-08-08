require "rails_helper"

RSpec.describe "Add Favorites API", type: :request do
  describe "POST /api/v1/favorites" do
    describe "happy path" do
      it "can add a favorite for a user when given valid parameters" do
        user = User.create!(name: "Mikejones", email: "mjones@gmail.com", password: "password", password_confirmation: "password")

        favorite_params = {
          api_key: user.api_key,
          country: "thailand",
          recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
          recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
        }

        post "/api/v1/favorites", params: JSON.generate(favorite_params), headers: { "CONTENT_TYPE" => "application/json" }

        expect(response).to be_successful
        expect(response.status).to eq(201)

        favorite = JSON.parse(response.body, symbolize_names: true)

        expect(favorite).to be_a(Hash)
        expect(favorite[:success]).to eq("Favorite added successfully")
      end
    end

    describe "sad path" do
      it "returns an error if the user's API key is invalid" do
        user = User.create!(name: "Mikejones", email: "mjones@gmail.com", password: "password", password_confirmation: "password")

        favorite_params = {
          api_key: "1111",
          country: "thailand",
          recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
          recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
        }

        post "/api/v1/favorites", params: JSON.generate(favorite_params), headers: { "CONTENT_TYPE" => "application/json" }

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        favorite = JSON.parse(response.body, symbolize_names: true)

        expect(favorite[:error]).to eq("Invalid API Key")
      end
    end
  end
end
