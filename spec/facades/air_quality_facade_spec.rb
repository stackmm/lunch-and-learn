require "rails_helper"

RSpec.describe AirQualityFacade do
  it "returns air quality data for a city", :vcr do
    air_quality = AirQualityFacade.get_air_quality("Nigeria")

    expect(air_quality).to be_a(AirQuality)
    expect(air_quality.city).to eq("Abuja")
    expect(air_quality.aqi).to be_a(Integer)
    expect(air_quality.pm25_concentration).to be_a(Float)
    expect(air_quality.co_concentration).to be_a(Float)
  end
end