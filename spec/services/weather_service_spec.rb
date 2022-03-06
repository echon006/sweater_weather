require 'rails_helper'

RSpec.describe WeatherService do
    describe 'get_weather(lat, lng)' do
      it 'returns weather for given location by lat/lng', :vcr do
        response = WeatherService.get_weather(39.738453, -104.984853)
        expect(response).to be_a Hash
        expect(response).to have_key :current
        expect(response[:current]).to be_a Hash

        expect(response).to have_key :hourly
        expect(response[:hourly]).to be_an Array

        expect(response).to have_key :daily
        expect(response[:daily]).to be_an Array

        expect(response).not_to have_key :minutely
        expect(response).not_to have_key :aletrs

    end
  end
end
