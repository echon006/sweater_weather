class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email

  has_secure_token :auth_token
end
