require './model/user'
require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra'

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://michael@127.0.0.1/makersbnb')
  DataMapper.finalize 

class MakersBnb < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, "static") }

  get '/' do
    name = params[:name]
    email = params[:email]
    password = params[:password]

    User.create(:name => name, :email => email, :password => password)
    erb :index
  end

  run! if app_file == $0
end
