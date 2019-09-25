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
    redirect 'listings/all'
  end

  get '/listings/all' do
    erb :'listings/all'
  end

  post '/listings/new' do
    name = params[:name]
    description = params[:description]
    price_pn = params[:price_pn]
    @user_obj = User.first(:name => session[:name])
    Space.create(:name => name, :description => description, :price_pn => price_pn, :user => @user_obj)
    redirect '/listings/all'
  end

  get '/listings/new' do
    erb :'/listings/new'
  end
  
  run! if app_file == $0
end
