class Api::V1::RoadTripsController < ApplicationController
  def new
  end

  def create
    start_location = params[:origin]
    destination = params[:destination]

    if start_location.present? && destination.present?
      route = RoadTripFacade.find_route(start_location, destination)
      render json: RoadTripSerializer.new(route)
    else
      render json: { data: { message: "Both starting location and destination must be specified"}}, status: 404
    end
  end
end
