class AirQualitySerializer
  include JSONAPI::Serializer
  set_id :null_id
  set_type :air_quality
  attributes :city, :aqi, :pm25_concentration, :co_concentration

  def null_id
    nil
  end
end