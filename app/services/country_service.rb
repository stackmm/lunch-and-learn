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
end