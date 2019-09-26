require 'data_mapper'
require_relative 'space'
require_relative 'user'

class Request
  include DataMapper::Resource

  property :id,       Serial
  property :date,     String, :required => true


  belongs_to :user
  belongs_to :space
end
