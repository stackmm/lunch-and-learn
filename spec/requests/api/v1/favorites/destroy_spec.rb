require "rails_helper"

RSpec.describe "Destroy Favorites API", type: :request do
  describe "DELETE /api/v1/favorites" do
    describe "happy path" do
      it "can delete a favorite for a user when given valid parameters" do
        user = User.create!(name: "Mikejones", email: "mjones@gmail.com", password: "password", password_confirmation: "password")
        favorite1 = user.favorites.create!(country: "thailand", recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html", recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        favorite2 = user.favorites.create!(country: "thailand", recipe_link: "https://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight-dinner-recipes-from-the-kitchn-123308", recipe_title: "Recipe: Egyptian Tomato Soup")
        expect(user.favorites.count).to eq(2)

        user_params = { api_key: user.api_key }

        delete "/api/v1/favorites/#{favorite1.id}", params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        favorite = JSON.parse(response.body, symbolize_names: true)

        expect(favorite[:success]).to eq("Favorite successfully deleted")
        expect(user.favorites.count).to eq(1)
      end
    end

    describe "sad path" do
      it "returns an error if the user's API key is invalid" do
        user = User.create!(name: "Mikejones", email: "mjones@gmail.com", password: "password", password_confirmation: "password")
        favorite1 = user.favorites.create!(country: "thailand", recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html", recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")

        user_params = { api_key: "111" }

        delete "/api/v1/favorites/#{favorite1.id}", params: user_params

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end

      it "returns an error if the favorite id is invalid" do
        user = User.create!(name: "Mikejones", email: "mjones@gmail.com", password: "password", password_confirmation: "password")
        favorite1 = user.favorites.create!(country: "thailand", recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html", recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")

        user_params = { api_key: "111" }

        delete "/api/v1/favorites/a1", params: user_params

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end
    end
  end
end
