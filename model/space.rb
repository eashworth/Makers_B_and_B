require_relative 'user'
require 'data_mapper'

class Space
  include DataMapper::Resource

  property :id,             Serial, :required => true
  property :name,           String, :required => true
  property :description,    String, :required => true
  property :price_pn,       Integer, :required => true

  # belongs_to :user 
end

