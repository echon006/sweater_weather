require 'rails_helper'

RSpec.describe ImageService do
    describe 'get_image(keyword)' do
      it 'returns a photo based on the keyword', :vcr do
        response = ImageService.get_image("Denver,CO")

        expect(response).to be_a Hash
        expect(response[:results][0]).to be_a Hash

        expect(response[:results][0]).to have_key :urls
        expect(response[:results][0][:urls]).to be_a Hash
        
        expect(response[:results][0][:user]).to have_key :name
        expect(response[:results][0][:user][:name]).to be_a String

        expect(response[:results][0][:user][:links]).to have_key :self
        expect(response[:results][0][:user][:links][:self]).to be_a String
    end
  end
end
