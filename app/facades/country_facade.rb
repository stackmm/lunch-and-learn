class CountryFacade
  def self.get_random_country
    response = CountryService.get_random_country
    Country.new(response)
  end
end