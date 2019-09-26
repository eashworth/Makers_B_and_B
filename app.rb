require './model/user'
require './model/space'
require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra'

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://Contrabando2@127.0.0.1/makersbnb')
  DataMapper.auto_upgrade!
  DataMapper.finalize

class MakersBnb < Sinatra::Base

  enable :sessions

  set :public_folder, Proc.new { File.join(root, "static") }

  get '/' do
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/home' do
    name = params[:name]
    email = params[:email]
    username = params[:username]
    password = params[:password]
    session[:username] = username
    User.create(:name => name, :email => email, :username => username, :password => password)
    redirect '/home'
  end

  get'/home' do
    @user_obj = User.first(:username => session[:username])
    erb :home
  end

  get '/listings/all' do
    erb :'listings/all'
  end

  post '/listings/new' do
    name = params[:name]
    description = params[:description]
    price_pn = params[:price_pn]
    date_from = params[:date_from]
    date_to = params[:date_to]
    @user_obj = User.first(:name => session[:name])
    Space.create(:name => name, :description => description, :price_pn => price_pn, :date_from => date_from, :date_to => date_to, :user => @user_obj)
    redirect '/listings/all'
  end

  get '/listings/new' do
    erb :'/listings/new'
  end

  run! if app_file == $0
end
