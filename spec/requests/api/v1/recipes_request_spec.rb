require "rails_helper"

RSpec.describe "Find Recipes by Country API", type: :request do
  describe "GET /api/v1/recipes" do
    describe "happy path" do
      it "can find recipes by country" do
        get "/api/v1/recipes?country=thailand"

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json; charset=utf-8")

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a(Hash)
        expect(recipes[:data]).to be_a(Array)

        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe).to have_key(:type)
          expect(recipe).to have_key(:attributes)

          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes]).to have_key(:image)
        end
      end

      it "can find recipes for a random country via REST Countries API" do
        get "/api/v1/recipes"

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json; charset=utf-8")

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a(Hash)
        expect(recipes[:data]).to be_a(Array)


        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe).to have_key(:type)
          expect(recipe).to have_key(:attributes)

          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes]).to have_key(:image)
        end
      end
    end

    describe "sad path" do
      it "returns an empty array if no recipes are found" do
        get "/api/v1/recipes?country=asdfasdfasdf"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a(Hash)
        expect(recipes[:data]).to be_a(Array)
        expect(recipes[:data]).to be_empty
      end

      it "returns an empty array if the country parameter is an empty string" do
        get "/api/v1/recipes?country="

        expect(response).to be_successful
        expect(response.status).to eq(200)

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a(Hash)
        expect(recipes[:data]).to be_a(Array)
        expect(recipes[:data]).to be_empty
      end

      it "returns an error if the country parameter is not valid" do
        get "/api/v1/recipes?country=applebees"

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end
    end
  end
end