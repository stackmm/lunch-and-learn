require "rails_helper"

RSpec.describe ApiNinjasService do
  it "establishes a connection and obtains air quality data for a city", :vcr do
    air_data = ApiNinjasService.get_air_quality("Abuja")

    expect(air_data).to be_a(Hash)
    expect(air_data[:overall_aqi]).to be_a(Integer)
    expect(air_data[:"PM2.5"][:concentration]).to be_a(Integer)
    expect(air_data[:CO][:concentration]).to be_a(Float)
  end
end