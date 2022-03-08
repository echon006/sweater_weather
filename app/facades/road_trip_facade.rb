class RoadTripFacade
  def self.find_route(start_location, destination)
    route = RoadTripService.find_route("Denver,CO", "Boulder,CO")
    coord = CoordinatesFacade.get_coord(destination)
    weather = WeatherService.get_weather(coord.lat, coord.lng)
    RoadTrip.new(route, weather, start_location, destination)
  end
end
