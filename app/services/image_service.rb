class ImageService
  def self.get_image(keyword)
    get_data("/search/photos?query=#{keyword}+weather&per_page=1")
  end

  private

  def self.conn
    Faraday.new('https://api.unsplash.com/') do |faraday|
        faraday.params['client_id'] = ENV['image_api_key']
      end
  end

  def self.get_data(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
