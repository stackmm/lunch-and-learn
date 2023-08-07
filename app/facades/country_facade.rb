class CountryFacade
  def self.get_random_country
    response = CountryService.get_random_country
    Country.new(response[:name][:common], response[:capital].first)
  end

  def self.get_country_by_name(country)
    response = CountryService.get_country_by_name(country)
    Country.new(response[:name][:common], response[:capital].first)
  end
end