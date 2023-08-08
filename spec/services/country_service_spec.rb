require "rails_helper"

RSpec.describe CountryService do
  it "establishes a connection and obtains a random country", :vcr do
    country = CountryService.get_random_country

    expect(country).to be_a(String)
  end

  it "can check if a country is valid", :vcr do
    expect(CountryService.valid_country?("Italy")).to eq(true)
    expect(CountryService.valid_country?("er3232")).to eq(false)
    expect(CountryService.valid_country?("thailand")).to eq(true)
    expect(CountryService.valid_country?("Thailand")).to eq(true)
  end
end