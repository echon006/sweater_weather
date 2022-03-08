require 'rails_helper'

RSpec.describe 'roadtrip API' do
    it 'returns a RoadTrip JSON', :vcr do

      post "/api/v1/road_trips?origin=Denver,CO&destination=Boulder,CO"

      route = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(route).to be_a Hash
      expect(route).to have_key :data

      expect(route[:data]).to have_key :id
      expect(route[:data]).to have_key :type
      expect(route[:data][:type]).to eq("road_trip")

      expect(route[:data]).to have_key :attributes
      expect(route[:data][:attributes]).to be_a Hash

      expect(route[:data][:attributes]).to have_key :start_city
      expect(route[:data][:attributes][:start_city]).to be_a String

      expect(route[:data][:attributes]).to have_key :end_city
      expect(route[:data][:attributes][:end_city]).to be_an String


      expect(route[:data][:attributes]).to have_key :travel_time
      expect(route[:data][:attributes][:travel_time]).to be_an String

      expect(route[:data][:attributes]).to have_key :weather_at_eta
      expect(route[:data][:attributes][:weather_at_eta]).to be_an Hash

  end
end
