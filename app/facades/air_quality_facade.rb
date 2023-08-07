class AirQualityFacade
  def self.get_air_quality(country)
    city = CountryService.get_country_by_name(country)[:capital].first
    air_quality = ApiNinjasService.get_air_quality(city)
    AirQuality.new(city, air_quality)
  end
end