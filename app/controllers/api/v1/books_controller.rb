class Api::V1::BooksController < ApplicationController
  def index
    location = params[:location]
    # quantity = params
    render json: BookSerializer.new(BooksFacade.get_book(location))
  end
end
