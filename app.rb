require "sinatra"
require "sinatra/activerecord"
require 'sinatra/contrib'
require "./models"
require "bundler/setup"
require "sinatra/flash"
require "./directory"

enable :sessions
set :database, "sqlite3:userdb.sqlite3"

def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end

before do 
    @myuserid = User.find(4).fname;
end

# POST STUFF
# SIGNUP
post '/register' do 

    @user = User.create(fname: params["fname"], lname: params["lname"], email: params["email"], bio: params["bio"], password: params["password"], dob: params["dob"], lastOn: params["lastOn"], admin: false, picture: params["picture"]);
end

# LOGIN
post '/signin' do 
    
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        return true;
    else
        return false;
    end
    
end

get '/posts' do
    @mainERB = :posts_test
    erb :layout
end

post '/posts' do
    @mainERB = :posts_test
end