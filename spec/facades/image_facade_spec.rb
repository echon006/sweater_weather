require 'rails_helper'

RSpec.describe ImageFacade do
  describe 'get_image(location)' do
    it 'returns image for a given location', :vcr do
    background_image = ImageFacade.get_image("Denver, CO")

    expect(background_image).to be_a Image

    expect(background_image.id).to be_nil
    expect(background_image.url).to_not be_nil
    expect(background_image.url).to be_a(String)
    expect(background_image.credit).to be_a Hash
    expect(background_image.credit[:source]).to be_a String
    expect(background_image.credit[:author]).to be_a String
    end
  end
end
