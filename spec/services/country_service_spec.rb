require "rails_helper"

RSpec.describe CountryService do
  it "establishes a connection and obtains a random country", :vcr do
    country = CountryService.get_random_country

    expect(country).to be_a(Hash)
    expect(country[:name][:common]).to be_a(String)
    expect(country).to have_key(:capital)
  end

  it "establishes a connection and obtains a country by name", :vcr do
    country = CountryService.get_country_by_name("Thailand")

    expect(country).to be_a(Hash)
    expect(country[:name][:common]).to be_a(String)
    expect(country).to have_key(:capital)
  end
end