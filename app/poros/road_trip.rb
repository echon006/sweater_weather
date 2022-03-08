class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta


  def initialize(route, weather, start_location, destination)
    @start_city = start_location
    @end_city = destination
    @travel_time = route[:route][:formattedTime]
    @weather_at_eta = weather(weather[:hourly])
  end

  def weather(data)
    {
      temperature: data[0][:temp],
      conditions: data[0][:weather][0][:description]
    }
  end

  # Get current time
  # add travel time
  # find weather at given time
end
