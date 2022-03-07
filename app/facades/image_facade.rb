class ImageFacade
  def self.get_image(location)
    background_image = ImageService.get_image(location)
    Image.new(background_image)
  end
end
