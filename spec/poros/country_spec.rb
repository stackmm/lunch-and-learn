require "rails_helper"

RSpec.describe Country do
  before(:each) do
    @country = Country.new("Thailand")
  end

  it "exists" do
    expect(@country).to be_a(Country)
  end

  it "has attributes" do
    expect(@country.name).to eq("Thailand")
  end
end