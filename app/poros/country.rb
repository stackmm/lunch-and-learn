class Country
  attr_reader :name, :capital

  # def initialize(data)
  #   @name = data
  # end
  def initialize(name, capital)
    @name = name
    @capital = capital
  end
end