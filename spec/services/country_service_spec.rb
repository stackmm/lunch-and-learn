require "rails_helper"

RSpec.describe CountryService do
  it "establishes a connection and obtains a random country name", :vcr do
    country = CountryService.new.get_random_country
    require 'pry'; binding.pry
  end
end