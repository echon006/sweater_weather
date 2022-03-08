class RoadTripFacade
  def self.find_route(start_location, destination)
    route = RoadTripService.find_route(start_location, destination)

    if route[:route][:formattedTime]
      coord = CoordinatesFacade.get_coord(destination)
      weather = WeatherService.get_weather(coord.lat, coord.lng)
      RoadTrip.new(route, weather, start_location, destination)
    elsif route[:info][:statuscode]
      weather = {hourly: [ temp: "", weather: [ description: ""]]}
      route = {route: {formattedTime: "Impossible"}}
      RoadTrip.new(route, weather, start_location, destination)
    end
  end
end
