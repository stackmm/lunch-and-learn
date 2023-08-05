require "rails_helper"

RSpec.describe CountryService do
  it "establishes a connection and obtains a random country", :vcr do
    country = CountryService.get_random_country

    expect(country).to be_a(String)
  end
end