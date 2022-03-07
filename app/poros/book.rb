class Book
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books


  def initialize(weather_data, book_data, location)
    @destination = location
    @forecast = weather(weather_data.current_weather)
    require "pry"; binding.pry
    @total_books_found = book_data[]
    @books = book_data[]
  end

  def weather(data)
    {
      summary: data[:conditions]
      temperature: data[:temp]
    }
  end
end
