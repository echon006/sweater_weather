class RoadTripService

  def self.find_route(start_location, destination)
    get_data("/directions/v2/route?from=#{start_location}&to=#{destination}")
  end

  private

  def self.conn
    Faraday.new('http://www.mapquestapi.com/') do |faraday|
        faraday.params['key'] = ENV['geo_code_api_key']
      end
  end

  def self.get_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
