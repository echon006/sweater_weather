class WeatherService
  def self.get_weather(lat, lng)
    get_data("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=imperial&exclude=alerts,minutely")
  end

  private

  def self.conn
    Faraday.new('https://api.openweathermap.org/') do |faraday|
        faraday.params['appid'] = ENV['weather_api_key']
      end
  end

  def self.get_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
