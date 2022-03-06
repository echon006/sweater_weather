class CoordinateService
  def self.get_coord(location)
    get_data("v1/address?location=#{location}")
  end

  private

  def self.conn
    Faraday.new('http://www.mapquestapi.com/geocoding/') do |faraday|
        faraday.params['key'] = ENV['geo_code_api_key']
      end
  end

  def self.get_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
