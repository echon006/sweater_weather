class Api::V1::ImagesController < ApplicationController
  def index
    location = params[:location]

    if location.present?
      render json: ImageSerializer.new(ImageFacade.get_image(location))
    else
      render json: { data: { message: "Must have a location"}}, status: 404
    end
  end
end
