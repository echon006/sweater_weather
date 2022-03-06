require 'rails_helper'

RSpec.describe CoordinatesFacade do
  describe 'get_coordinates(location)' do
    it 'returns coordinates for a searched location', :vcr do
    coord = CoordinatesFacade.get_coord("Denver, CO")

    expect(coord).to be_a Coordinates

    expect(coord.lng).to_not be_nil
    expect(coord.lng).to be_a(Float)
    expect(coord.lat).to_not be_nil
    expect(coord.lat).to be_a(Float)
    end
  end
end
