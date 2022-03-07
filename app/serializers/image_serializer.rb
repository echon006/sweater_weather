class ImageSerializer
  include JSONAPI::Serializer

  attributes :id,
             :url,
             :credit

end
