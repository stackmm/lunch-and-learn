class Recipe
  attr_reader :id, :title, :url, :country, :image

  def initialize(data)
    @id = nil
    @title = data[:label]
    @url = data[:url]
    @country = data[:country]
    @image = data[:image]
  end
end