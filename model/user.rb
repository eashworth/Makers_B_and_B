require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :email,    String
  property :password, String

  has n, :spaces
  has n, :requests

end
