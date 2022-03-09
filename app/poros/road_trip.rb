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
    @time_at_eta = estimated_time(weather[:current])
    @weather_at_eta = weather(weather[:hourly][@time_at_eta])
  end

  def weather(data)
    {
      temperature: data[:temp],
      conditions: data[:weather][0][:description]
    }
  end

  def estimated_time(data)
    if data != nil
      total_hours = 0
      start_route_time = Time.at(data[:dt]).strftime("%H:%M")
      hour_route_time = start_route_time.split("")[0..1].join.to_i
      minute_route_time = start_route_time.split("")[3..4].join.to_i
      hour_travel_time = @travel_time.split("")[0..1].join.to_i
      minute_travel_time = @travel_time.split("")[3..4].join.to_i
      total_min = minute_route_time + minute_travel_time
      total_hour = hour_route_time + hour_travel_time

      if total_min >= 91
        total_hours += 2
      elsif total_min >= 30 && total_min <= 90
        total_hours += 1
      end
      total_hours
      arrival_hour = total_hours + total_hour
      arrival_hour
    else
      0
    end 
  end




  # Get current time
  # add travel time
  # find weather at given time
end
