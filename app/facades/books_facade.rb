class BooksFacade
  def self.get_book(location)
    coord = CoordinatesFacade.get_coord(location)
    coords_data = WeatherService.get_weather(coord.lat, coord.lng)
    book_data = BookService.get_book(location)
    Book.new(coords, book)
  end
end
