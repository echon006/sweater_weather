class Api::V1::ForecastsController < ApplicationController
  def index
    location = params[:location]
    if location.present?
      render json: ForecastSerializer.new(WeatherFacade.get_forecast(location))
    else
      render json: { data: { message: "Must have a location"}}, status: 404
    end
  end
end
