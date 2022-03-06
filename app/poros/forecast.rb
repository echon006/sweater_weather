class Forecast
  attr_reader :id,
              :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(data)
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily])[0..4]
    @hourly_weather = hourly(data[:hourly])[0..7]
  end

  def current(data)
    {
      datetime: Time.at(data[:dt]).strftime("%H:%M, %B %e, %z"),
      sunrise: Time.at(data[:sunrise]).strftime("%H:%M, %B %e, %z"),
      sunset: Time.at(data[:sunset]).strftime("%H:%M, %B %e, %z"),
      temp: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    }
  end

  def daily(data)
    data.map do |day|
      {
        date: Time.at(day[:dt]).strftime("%B-%e-%Y"),
        sunrise: Time.at(day[:sunrise]).strftime("%H:%M, %B %e, %z"),
        sunset: Time.at(day[:sunset]).strftime("%H:%M, %B %e, %z"),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def hourly(data)
  data.map do |hour|
    {
      time: Time.at(hour[:dt]).strftime("%H:%M"),
      temp: hour[:temp],
      conditions: hour[:weather][0][:description],
      icon: hour[:weather][0][:icon],
    }
  end
end
end
