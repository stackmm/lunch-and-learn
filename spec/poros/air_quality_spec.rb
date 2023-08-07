require "rails_helper"

RSpec.describe AirQuality do
  before(:each) do
    @air_quality = AirQuality.new("Abuja", {
      overall_aqi: 27,
      "PM2.5": { concentration: 8.45 },
      CO: { concentration: 547.41 }
    })
  end

  it "exists" do
    expect(@air_quality).to be_a(AirQuality)
  end

  it "has attributes" do
    expect(@air_quality.id).to eq(nil)
    expect(@air_quality.city).to eq("Abuja")
    expect(@air_quality.aqi).to eq(27)
    expect(@air_quality.pm25_concentration).to eq(8.45)
    expect(@air_quality.co_concentration).to eq(547.41)
  end
end