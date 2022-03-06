require 'rails_helper'

RSpec.describe CoordinateService do
  describe 'class methods' do
    describe 'get_coords(location)' do
      it 'returns coords based on the search params', :vcr do
        search_response = CoordinateService.get_coord("Denver,CO")
        expect(search_response).to be_a Hash

        expect(search_response[:results][0]).to have_key(:locations)
        expect(search_response[:results][0][:locations]).to be_an Array

        expect(search_response[:results][0][:locations][0]).to have_key(:latLng)
        expect(search_response[:results][0][:locations][0][:latLng]).to be_a Hash

        expect(search_response[:results][0][:locations][0][:latLng]).to have_key(:lat)
        expect(search_response[:results][0][:locations][0][:latLng]).to have_key(:lng)
        expect(search_response[:results][0][:locations][0][:latLng][:lat]).to be_a Float
        expect(search_response[:results][0][:locations][0][:latLng][:lng]).to be_a Float
      end
    end
  end
end
