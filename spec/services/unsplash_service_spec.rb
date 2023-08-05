require "rails_helper"

RSpec.describe UnsplashService do
  it "establishes a connection and obtains images of the query", :vcr do
    country = "Laos"
    images = UnsplashService.get_images_by_country(country)

    expect(images).to be_a(Array)

    images.each do |image|
      expect(image[:urls]).to have_key(:raw)
      expect(image[:urls][:thumb]).to be_a(String)
      expect(image[:alt_description]).to be_a(String)
    end
  end
end