require 'rails_helper'

RSpec.describe BooksFacade do
  describe 'get_book(location)' do
    it 'returns book for a searched location', :vcr do
    book = BooksFacade.get_book("Denver, CO", "5")

    expect(book).to be_a Book

    expect(book.destination).to_not be_nil
    expect(book.destination).to be_a String

    expect(book.forecast).to_not be_nil
    expect(book.forecast).to be_a Hash

    expect(book.total_books_found).to_not be_nil
    expect(book.total_books_found).to be_an Integer

    expect(book.books).to_not be_nil
    expect(book.books).to be_an Array
    expect(book.books.count).to eq(5)
    end
  end
end
