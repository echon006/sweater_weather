class Api::V1::ImagesController < ApplicationController
  def index
    location = params[:location]
    render json: ImageSerializer.new(ImageFacade.get_image(location))
  end
end
