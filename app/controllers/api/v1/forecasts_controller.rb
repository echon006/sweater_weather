class Api::V1::ForecastsController < ApplicationController
  def index
    location = params[:location]
    render json: ForecastSerializer.new(WeatherFacade.get_forecast(location))
  end
end
