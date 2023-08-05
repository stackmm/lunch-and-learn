require "rails_helper"

RSpec.describe "Find Learning Resources by Country API", type: :request do
  describe "GET /api/v1/learning_resources" do
    describe "happy path" do
      it "can find learning resources by country" do
        get "/api/v1/learning_resources?country=laos"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        resource = JSON.parse(response.body, symbolize_names: true)

        expect(resource).to be_a(Hash)
        expect(resource[:data]).to be_a(Hash)
        expect(resource[:data]).to have_key(:id)
        expect(resource[:data][:id]).to eq(nil)
        expect(resource[:data]).to have_key(:type)
        expect(resource[:data][:type]).to eq("learning_resource")

        expect(resource[:data]).to have_key(:attributes)
        expect(resource[:data][:attributes]).to be_a(Hash)
        expect(resource[:data][:attributes]).to have_key(:country)
        expect(resource[:data][:attributes][:country]).to eq("laos")

        expect(resource[:data][:attributes]).to have_key(:video)
        expect(resource[:data][:attributes][:video]).to be_a(Hash)
        expect(resource[:data][:attributes][:video]).to have_key(:title)
        expect(resource[:data][:attributes][:video][:title]).to be_a(String)
        expect(resource[:data][:attributes][:video]).to have_key(:youtube_video_id)
        expect(resource[:data][:attributes][:video][:youtube_video_id]).to be_a(String)

        expect(resource[:data][:attributes]).to have_key(:images)

        resource[:data][:attributes][:images].each do |image|
          expect(image).to be_a(Hash)
          expect(image).to have_key(:alt_tag)
          expect(image[:alt_tag]).to be_a(String)
          expect(image).to have_key(:url)
          expect(image[:url]).to be_a(String)
        end

      end
    end

    describe "sad path" do

    end
  end
end