class Api::V1::AirQualityController < ApplicationController
  def show
    country = params[:country]
    air_quality = AirQualityFacade.get_air_quality(country)
    render json: AirQualitySerializer.new(air_quality)
  end
end