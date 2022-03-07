class Api::V1::BooksController < ApplicationController
  def index
    location = params[:location]
    quantity = params[:quantity]
    render json: BookSerializer.new(BooksFacade.get_book(location, quantity))
  end
end
