require "rails_helper"

RSpec.describe CountryService do
  it "establishes a connection and obtains a random country name", :vcr do
    country = CountryService.get_country("thailand")
    require 'pry'; binding.pry
  end
end