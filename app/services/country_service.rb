class CountryService
  def self.conn
    Faraday.new(url: "https://restcountries.com/v3.1/")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_random_country
    countries = get_url("all")
    countries.sample[:name][:common]
  end

  def self.valid_country?(country)
    capitalize_country = country.capitalize
    all_countries.include?(capitalize_country)
  end

  private

  def self.all_countries
    @_all_countries ||= get_url("all").map do |country|
      country[:name][:common]
    end
  end
end