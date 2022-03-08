class Api::V1::RoadTripsController < ApplicationController
  def new
  end

  def create
    start_location = params[:origin]
    destination = params[:destination]
    route = RoadTripFacade.find_route(start_location, destination)
    render json: RoadTripSerializer.new(route)
  end
end
