class BooksFacade
  def self.get_book(location, quantity)
    coords_data = WeatherFacade.get_forecast(location)
    book_data = BookService.get_book(location)
    Book.new(coords_data, book_data, location, quantity)
  end
end
