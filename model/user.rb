require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial, :required => true
  property :name,     String, :required => true
  property :email,    String, :required => true
  property :password, String, :required => true
end
