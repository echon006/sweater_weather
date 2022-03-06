class CoordinatesFacade
  def self.get_coord(location)
    coords = CoordinatesService.get_coord(location)
    Coordinates.new(coords)
  end
end
