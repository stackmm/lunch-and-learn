require "rails_helper"

RSpec.describe YoutubeService do
  it "establishes a connection and obtains a video", :vcr do
    video = YoutubeService.get_video_by_country("Laos")

    expect(video).to be_a(Hash)
    expect(video[:id]).to have_key(:videoId)
    expect(video[:id][:videoId]).to eq("uw8hjVqxMXw")
    expect(video[:snippet]).to have_key(:title)
    expect(video[:snippet][:title]).to eq("A Super Quick History of Laos")
  end
end