require 'rails_helper'

RSpec.describe 'forecast API' do
    it 'returns a forecast in JSON', :vcr do

      get "/api/v1/forecasts?location=Denver,CO"

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(forecast).to be_a Hash
      expect(forecast).to have_key :data

      expect(forecast[:data]).to have_key :id
      expect(forecast[:data]).to have_key :type
      expect(forecast[:data][:type]).to eq("forecast")
      expect(forecast[:data]).to have_key :attributes
      expect(forecast[:data][:attributes]).to be_a Hash

      expect(forecast[:data][:attributes]).to have_key :current_weather
      expect(forecast[:data][:attributes][:current_weather]).to be_a Hash

      expect(forecast[:data][:attributes]).to have_key :daily_weather
      expect(forecast[:data][:attributes][:daily_weather]).to be_an Array
      expect(forecast[:data][:attributes][:daily_weather].length).to eq(5)

      expect(forecast[:data][:attributes]).to have_key :hourly_weather
      expect(forecast[:data][:attributes][:hourly_weather]).to be_an Array
      expect(forecast[:data][:attributes][:hourly_weather].length).to eq(8)
  end

  it "returns an error if not location is given", :vcr do
    get "/api/v1/forecasts?location="

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(404)

    expect(forecast).to be_a Hash
    expect(forecast).to have_key :data
    expect(forecast[:data]).to have_key :message
    expect(forecast[:data][:message]).to eq("Must have a location")
  end
end
