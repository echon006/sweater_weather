require 'rails_helper'

RSpec.describe 'Book API' do
  it 'returns a Book in JSON', :vcr do

    get "/api/v1/book-search?location=denver,co&quantity=5"

    book_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(book_response).to be_a Hash
    expect(book_response).to have_key :data

    expect(book_response[:data]).to have_key :id
    expect(book_response[:data]).to have_key :type
    expect(book_response[:data][:type]).to eq("books")

    expect(book_response[:data]).to have_key :attributes
    expect(book_response[:data][:attributes]).to be_a Hash

    expect(book_response[:data][:attributes]).to have_key :destination
    expect(book_response[:data][:attributes][:destination]).to be_a String

    expect(book_response[:data][:attributes]).to have_key :forecast
    expect(book_response[:data][:attributes][:forecast]).to be_an Hash

    expect(book_response[:data][:attributes]).to have_key :total_books_found
    expect(book_response[:data][:attributes][:total_books_found]).to be_an Integer

    expect(book_response[:data][:attributes]).to have_key :books
    expect(book_response[:data][:attributes][:books]).to be_an Array
    expect(book_response[:data][:attributes][:books].count).to eq(5)

  end
end
