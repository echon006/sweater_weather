require 'rails_helper'

RSpec.describe Book do
  it 'exists', :vcr do
    weather_data =  WeatherFacade.get_forecast("Denver, CO")

    book_data =
    {:numFound=>657,
     :docs=>
        [{
          :title=>"Denver, Co",
          :isbn=>["9780762507849", "0762507845"],
          :publisher=>["Universal Map Enterprises"]
        }]}
    location = "Denver,CO"
    quantity = "5"

    book = Book.new(weather_data, book_data, location, quantity)

    expect(book.destination).to be_a String
    expect(book.destination).to eq("Denver,CO")

    expect(book.forecast).to be_an Hash
    expect(book.total_books_found).to be_an Integer
    expect(book.books).to be_an Array
  end

  it "checks that forecast has the correct keys", :vcr do
    weather_data =  WeatherFacade.get_forecast("Denver, CO")

    book_data =
    {:numFound=>657,
     :docs=>
        [{
          :title=>"Denver, Co",
          :isbn=>["9780762507849", "0762507845"],
          :publisher=>["Universal Map Enterprises"]
        }]}
    location = "Denver,CO"
    quantity = "5"

    book = Book.new(weather_data, book_data, location, quantity)

    expect(book.forecast).to be_an Hash
    expect(book.forecast).to have_key :summary
    expect(book.forecast).to have_key :temperature
  end

  it "checks that a single book has the correct keys", :vcr do
    weather_data =  WeatherFacade.get_forecast("Denver, CO")

    book_data =
    {:numFound=>657,
     :docs=>
        [{
          :title=>"Denver, Co",
          :isbn=>["9780762507849", "0762507845"],
          :publisher=>["Universal Map Enterprises"]
        }]}
    location = "Denver,CO"
    quantity = "5"

    book = Book.new(weather_data, book_data, location, quantity)

    expect(book.books).to be_an Array
    expect(book.books.first).to be_an Hash

    expect(book.books.first).to have_key :isbn
    expect(book.books.first).to have_key :title
    expect(book.books.first).to have_key :publisher

  end
end
