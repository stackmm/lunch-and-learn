require "rails_helper"

RSpec.describe Country do
  before(:each) do
    @country = Country.new("Thailand", "Bangkok")
  end

  it "exists" do
    expect(@country).to be_a(Country)
  end

  it "has attributes" do
    expect(@country.name).to eq("Thailand")
    expect(@country.capital).to eq("Bangkok")
  end
end