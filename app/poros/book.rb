class Book
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books


  def initialize(weather_data, book_data, location)
    @destination = location
    @forecast = weather(weather_data.current_weather)
    @total_books_found = book_data[:numFound]
    @books = book_list(book_data[:docs])
  end

  def weather(data)
    {
      summary: data[:conditions],
      temperature: data[:temp]
    }
  end

  def book_list(data)
    data.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end
end
