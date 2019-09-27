require './model/user'
require './model/space'
require './lib/login'
require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra'

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://student@127.0.0.1/makersbnb')
  DataMapper.auto_upgrade!
  DataMapper.finalize

class MakersBnb < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  set :public_folder, Proc.new { File.join(root, "static") }

  get '/' do
    if session[:username]
      redirect '/home'
    else
      erb :index
    end
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    user = User.create(
      :name => params[:name],
      :email => params[:email],
      :username => params[:username]
    )
    user.password = params[:password]
    if user.id
      session[:username] = params[:username]
      flash[:notice] = "Registration successful!"
      redirect '/home'
    else
      flash[:notice] = "Username already in use. Please choose another."
      redirect '/register'
    end
  end

  get '/home' do
    if session[:username]
      @user_obj = User.first(:username => session[:username])
      erb :home
    else
      redirect '/'
    end
  end

  get '/logout' do
    flash[:notice] = "You have logged out."
    session[:username] = nil
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if Login.check_login(params[:username], params[:password])
      session[:username] = params[:username]
      flash[:notice] = "Thank you for logging in."
      redirect '/home'
    else
      flash[:notice] = "Login failed: incorrect username and/or password."
      redirect '/login'
    end
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
