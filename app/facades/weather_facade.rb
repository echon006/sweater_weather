class WeatherFacade
  def self.get_forecast(location)
    coord = CoordinatesFacade.get_coord(location)
    coords = WeatherService.get_weather(coord.lat, coord.lng)
    Forecast.new(coords)
  end
end
