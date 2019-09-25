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

  enable :sessions

  set :public_folder, Proc.new { File.join(root, "static") }

  get '/' do
    erb :index
  end 

  post '/new' do
    name = params[:name]
    email = params[:email]
    password = params[:password]

    User.create(:name => name, :email => email, :password => password)
    session[:user_id] = User.first(:name => name).id

    p User.first(:name => name).id
    p User.first(:name => name).name
    p "USER ID:"
    p session[:user_id]
    erb :new
  end

  get '/listings' do
    # name = params[:name]
    # description = params[:description]
    # price_pn = params[:price_pn]
    p "USER ID:"
    p session[:user_id]
    @user_id = session[:user_id]
    erb :listings
  end 

  run! if app_file == $0
end
