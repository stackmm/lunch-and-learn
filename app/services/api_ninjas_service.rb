class ApiNinjasService
  def self.conn
    Faraday.new(url: "https://api.api-ninjas.com/v1/") do |f|
      f.headers["X-Api-Key"] = ENV["API_NINJAS_KEY"]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_air_quality(city)
    get_url("airquality?city=#{city}")
  end
end