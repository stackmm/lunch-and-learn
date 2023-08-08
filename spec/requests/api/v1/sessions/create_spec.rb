require "rails_helper"

RSpec.describe "User Log In API", type: :request do
  describe "POST /api/v1/sessions" do
    describe "happy path" do
      it "can log in a user when given valid parameters" do
        user = User.create!(name: "Bob", email: "mjones@gmail.com", password: "password", password_confirmation: "password")

        user_params = {
          email: "mjones@gmail.com",
          password: "password"
        }

        post "/api/v1/sessions", params: JSON.generate(user_params), headers: { "CONTENT_TYPE" => "application/json" }

        expect(response).to be_successful
        expect(response.status).to eq(200)

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(user_response[:data][:id]).to eq(user.id.to_s)
        expect(user_response[:data][:type]).to eq("user")
        expect(user_response[:data][:attributes][:name]).to eq(user.name)
        expect(user_response[:data][:attributes][:email]).to eq(user.email)
        expect(user_response[:data][:attributes][:api_key]).to eq(user.api_key)
      end
    end

    describe "sad path" do
      it "returns an error if any field is missing" do
        user = User.create!(name: "Bob", email: "mjones@gmail.com", password: "password", password_confirmation: "password")

        user_params = { email: "mjones@gmail.com" }

        post "/api/v1/sessions", params: JSON.generate(user_params), headers: { "CONTENT_TYPE" => "application/json" }

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(user_response[:error]).to eq("Invalid credentials")
      end

      it "returns an error if credentials are invalid" do
        user = User.create!(name: "Bob", email: "mjones@gmail.com", password: "password", password_confirmation: "password")

        user_params = {
          email: "mjones@gmail.com",
          password: "notpassword"
        }

        post "/api/v1/sessions", params: JSON.generate(user_params), headers: { "CONTENT_TYPE" => "application/json" }

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(user_response[:error]).to eq("Invalid credentials")
      end
    end
  end
end
