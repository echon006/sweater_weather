class Image
  attr_reader :id,
              :url,
              :credit

  def initialize(data)
    @id = nil
    @url = data[:results][0][:urls][:raw]
    @credit = image_credit(data[:results][0][:user])
  end

  def image_credit(data)
    {
      source: data[:links][:self],
      author: data[:name]
    }
  end
end
