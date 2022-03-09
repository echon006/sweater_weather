require 'rails_helper'

RSpec.describe 'roadtrip API' do
    it 'returns a RoadTrip JSON', :vcr do
      user = User.create!(email: "user_1@email.com", password: 'password_1', password_confirmation: "password_1", auth_token: "1234567")

      post "/api/v1/road_trips?origin=Denver,CO&destination=Boulder,CO&api_key=1234567"

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

  it "returns an specific error if destination is not valid ", :vcr do
    user = User.create!(email: "user_1@email.com", password: 'password_1', password_confirmation: "password_1", auth_token: "1234567")

    post "/api/v1/road_trips?origin=Denver,CO&destination=London,UK&api_key=1234567"

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
    expect(route[:data][:attributes][:travel_time]).to eq("Impossible")

    expect(route[:data][:attributes]).to have_key :weather_at_eta
    expect(route[:data][:attributes][:weather_at_eta]).to be_an Hash
    expect(route[:data][:attributes][:weather_at_eta][:temperature]).to eq("")
    expect(route[:data][:attributes][:weather_at_eta][:conditions]).to eq("")
  end

  it "returns an error if start location is not given", :vcr do

    user = User.create!(email: "user_1@email.com", password: 'password_1', password_confirmation: "password_1", auth_token: "1234567")

    post "/api/v1/road_trips?&destination=London,UK&api_key=1234567"

    route = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(404)

    expect(route).to be_a Hash
    expect(route).to have_key :data
    expect(route[:data]).to have_key :message
    expect(route[:data][:message]).to eq("Both starting location and destination must be specified")
  end

  it "returns an error if destination is not given", :vcr do
    user = User.create!(email: "user_1@email.com", password: 'password_1', password_confirmation: "password_1", auth_token: "1234567")

    post "/api/v1/road_trips?origin=Denver,CO&&api_key=1234567"

    route = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(404)

    expect(route).to be_a Hash
    expect(route).to have_key :data
    expect(route[:data]).to have_key :message
    expect(route[:data][:message]).to eq("Both starting location and destination must be specified")
  end

  it "returns an error if no API key is not valid" do
    user = User.create!(email: "user_1@email.com", password: 'password_1', password_confirmation: "password_1", auth_token: "1234567")

    post "/api/v1/road_trips?origin=Denver,CO&destination=Boulder,CO&api_key=123456"

    post "/api/v1/road_trips?origin=Denver,CO"
    
    expect(response).not_to be_successful
    expect(response.status).to eq(404)
  end
end
