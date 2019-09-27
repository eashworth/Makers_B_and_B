require 'data_mapper'

class Booking
  include DataMapper::Resource

  property :id,           Serial
  property :date,         Date
  property :customer,     Integer
  property :space_id,     Integer
  property :owner,        Integer 

  # has n, :spaces
  # has n, :users

end
