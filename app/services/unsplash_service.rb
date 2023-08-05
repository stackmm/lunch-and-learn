class UnsplashService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com/search/photos") do |f|
      f.params["client_id"] = ENV["UNSPLASH_API_KEY"]
    end
  end

  def self.get_images_by_country(country)
    response = conn.get("", {
      query: country,
      per_page: 10
    })

    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end