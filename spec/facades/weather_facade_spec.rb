require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'get_forecast(lat, lng)' do
    it 'returns forcast for a given area', :vcr do
    forecast = WeatherFacade.get_forecast("Denver, CO")

    expect(forecast).to be_a Forecast

    expect(forecast.id).to be_nil
    expect(forecast.current_weather).to_not be_nil
    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.hourly_weather).to_not be_nil
    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.daily_weather).to_not be_nil
    expect(forecast.daily_weather).to be_an(Array)
    end
  end
end
