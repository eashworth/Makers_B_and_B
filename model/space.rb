require 'data_mapper'
require_relative 'user'

class Space
  include DataMapper::Resource

  property :id,             Serial, :required => true
  property :name,           String, :required => true
  property :description,    String, :required => true
  property :price_pn,       Integer, :required => true
  property :date_from,      Date, :required => true
  property :date_to,        Date, :required => true

  belongs_to :user

  has n, :requests
end
