require 'rails_helper'

RSpec.describe RoadTripService do
  describe 'find_route(start, destination)' do
    it 'returns route JSON based on two locations', :vcr do
      route_response = RoadTripService.find_route("Denver,CO", "Boulder,CO")
      expect(route_response).to be_a Hash

      expect(route_response[:route]).to have_key :formattedTime
      expect(route_response[:route][:formattedTime]).to be_an String
    end

    it 'It cannot check for distance outside of the US', :vcr do
      route_response = RoadTripService.find_route("Denver,CO", " London, UK")
      expect(route_response).to be_a Hash
      expect(route_response[:route]).not_to have_key :formattedTime
      expect(route_response[:route]).to have_key :routeError
    end
  end
end
