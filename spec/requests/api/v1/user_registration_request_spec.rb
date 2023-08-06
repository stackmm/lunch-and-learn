require "rails_helper"

RSpec.describe "User Registration API", type: :request do
  describe "POST /api/v1/users" do
    describe "happy path" do
      it "can create a new user when given valid parameters" do
        user_params = {
          name: "Mikejones",
          email: "mjones@gmail.com",
          password: "password",
          password_confirmation: "password"
        }

        post "/api/v1/users", params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(201)

        user = JSON.parse(response.body, symbolize_names: true)

        expect(user).to be_a(Hash)
        expect(user[:data]).to be_a(Hash)
        expect(user[:data]).to have_key(:id)
        expect(user[:data][:type]).to eq("user")
        expect(user[:data][:attributes]).to be_a(Hash)
        expect(user[:data][:attributes]).to have_key(:name)
        expect(user[:data][:attributes][:name]).to be_a(String)
        expect(user[:data][:attributes]).to have_key(:email)
        expect(user[:data][:attributes][:email]).to be_a(String)
        expect(user[:data][:attributes]).to have_key(:api_key)
        expect(user[:data][:attributes][:api_key]).to be_a(String)
      end
    end

    describe "sad path" do

    end
  end
end