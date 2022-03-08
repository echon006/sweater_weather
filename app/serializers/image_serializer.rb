class ImageSerializer
  include JSONAPI::Serializer

  attributes :url,
             :credit

end
