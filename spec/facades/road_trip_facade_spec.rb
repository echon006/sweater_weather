require 'rails_helper'

RSpec.describe RoadTripFacade do
  describe 'find_route(start_location, destination)' do
    it 'returns travel time for a give route', :vcr do
    route = RoadTripFacade.find_route("Denver,CO", "Boulder,CO")

    expect(route).to be_a RoadTrip
    expect(route).to be_a Hash

    expect(route.start_city).to_not be_nil
    expect(route.start_city).to be_a String
    expect(route.end_city).to_not be_nil
    expect(route.end_city).to be_a String
    expect(route.travel_time).to_not be_nil
    expect(route.travel_time).to be_a String
    expect(route.weather_at_eta).to_not be_nil
    expect(route.weather_at_eta).to be_a Hash
    end
  end
end
