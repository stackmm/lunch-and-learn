class RecipeService
  def self.conn
    Faraday.new(url: "https://api.edamam.com/api/recipes/v2") do |f|
      f.params["type"] = "public"
      f.params["app_id"] = ENV["EDAMAM_APP_ID"]
      f.params["app_key"] = ENV["EDAMAM_APP_KEY"]
    end
  end

  def self.get_recipes_by_country(country)
    response = conn.get('', q: country)
    JSON.parse(response.body, symbolize_names: true)
  end
end