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

        post "/api/v1/sessions", params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        # expect(response.body).to eq("{\"data\":{\"id\":\"#{user.id}\",\"type\":\"user\",\"attributes\":{\"name\":\"Bob\",\"email\":\"}")
        expect(response.body).to include(user.name)
        expect(response.body).to include(user.email)
        expect(response.body).to include(user.api_key)
      end
    end

    describe "sad path" do
      xit "returns an error if any field is missing" do
        user = User.create!(name: "Bob", email: "mjones@gmail.com", password: "password", password_confirmation: "password")

        user_params = { email: "mjones@gmail.com" }

        post "/api/v1/sessions", params: user_params
      end

      xit "returns an error if credentials are invalid" do
        user = User.create!(name: "Bob", email: "mjones@gmail.com", password: "password", password_confirmation: "password")

        user_params = {
          email: "mjones@gmail.com",
          password: "notpassword"
        }

        post "/api/v1/sessions", params: user_params
      end
    end
  end
end
