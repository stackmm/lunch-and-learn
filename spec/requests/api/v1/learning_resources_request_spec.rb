require "rails_helper"

RSpec.describe "Find Learning Resources by Country API", type: :request do
  describe "GET /api/v1/learning_resources" do
    describe "happy path" do
      it "can find learning resources by country" do
        get "/api/v1/learning_resources?country=laos"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        resources = JSON.parse(response.body, symbolize_names: true)

        expect(resources).to be_a(Hash)
        expect(resources[:data]).to be_a(Array)
      end
    end

    describe "sad path" do

    end
  end
end