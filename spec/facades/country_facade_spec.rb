require "rails_helper"

RSpec.describe CountryFacade do
  it "returns a random country object", :vcr do
    country = CountryFacade.get_random_country

    expect(country).to be_a(Country)
    expect(country.name).to be_a(String)
  end
end