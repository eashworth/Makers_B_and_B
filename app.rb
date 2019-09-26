require './model/request'
require './model/user'
require './model/space'
require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra'

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://rafaela@127.0.0.1/makersbnb')
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

  post '/listings/all' do
    date = params[:date]
    @space_obj = Space.get(params[:space_id].to_i)
    @user_obj = User.first(:name => session[:name])
    Request.create(:date => date, :user => @user_obj, :space => @space_obj)
    session[:request_id] = Request.first(:date => date).id
    redirect '/listings/req_confirmation'
  end

  get '/listings/req_confirmation' do
    @request_date = Request.get(session[:request_id]).date
    erb :'listings/req_confirmation'
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
