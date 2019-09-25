require './model/user'
require './model/space'
require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra'

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://michael@127.0.0.1/makersbnb')
  DataMapper.auto_upgrade!
  DataMapper.finalize 

class MakersBnb < Sinatra::Base

  enable :sessions

  set :public_folder, Proc.new { File.join(root, "static") }

  get '/' do
    erb :index
  end 

  post '/' do
    name = params[:name]
    session[:name] = name
    email = params[:email]
    password = params[:password]

    User.create(:name => name, :email => email, :password => password)
    erb :index
  end

  get '/listings' do
    erb :listings
  end 

  post '/listings' do 
    name = params[:name]
    description = params[:description]
    price_pn = params[:price_pn]
    @user_obj = User.first(:name => session[:name])
    Space.create(:name => name, :description => description, :price_pn => price_pn, :user => @user_obj)
    redirect '/'
  end

  run! if app_file == $0
end
