require 'sinatra/base'
require 'sinatra/flash'
require 'spec_helper'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://student@127.0.0.1/makersBnB')
DataMapper.auto_migrate!

class MakersBnb < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, "static") }

  get '/' do
    er :index
  end
end
