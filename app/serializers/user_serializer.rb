class UserSerializer
  include JSONAPI::Serializer

  attributes :email

  attribute :api_key do |user|
    user.auth_token
  end
end
