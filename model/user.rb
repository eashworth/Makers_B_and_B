require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :email,    String
  property :username, String, :unique => true
  property :password_digest, Text

  has n, :spaces
  has n, :requests

  def password=(password)
    hashed_password = BCrypt::Password.create(password)
    update(password_digest: hashed_password)
  end  
end
