require "rails_helper"

RSpec.describe LearningResourceFacade do
  it "returns a learning resource object for a specific country", :vcr do
    resource = LearningResourceFacade.get_resources("laos")

    expect(resource).to be_a(LearningResource)
    expect(resource.country).to be_a(String)
    expect(resource.video).to be_a(Hash)
    expect(resource.video[:title]).to be_a(String)
    expect(resource.video[:video_id]).to be_a(String)
    expect(resource.images).to be_a(Array)
    expect(resource.images[0][:alt_tag]).to be_a(String)
    expect(resource.images[0][:url]).to be_a(String)
  end
end