require 'rails_helper'

RSpec.describe BookService do
    describe 'get_book(keyword)' do
      it 'returns a book based on the keyword', :vcr do
        response = BookService.get_book("Denver,CO")

        expect(response).to be_a Hash

        expect(response).to have_key(:numFound)
        expect(response[:numFound]).to be_an Integer

        expect(response[:docs][0]).to have_key(:isbn)
        expect(response[:docs][0][:isbn]).to be_an Array

        expect(response[:docs][0]).to have_key(:title)
        expect(response[:docs][0][:title]).to be_an String

        expect(response[:docs][0]).to have_key(:publisher)
        expect(response[:docs][0][:publisher]).to be_an Array
    end
  end
end
