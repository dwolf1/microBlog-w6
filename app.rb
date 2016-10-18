require "sinatra"
require "sinatra/activerecord"
require 'sinatra/contrib'
require "./models"
require "bundler/setup"
require "sinatra/flash"

enable :sessions

set :database, "sqlite3:userdb.sqlite3"

def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end


before do 
    @mainERB = :postfeed;
    @sideERB = :front;
    @myuserid = "ThebestNameoutthere";
end

get '/register' do
    @sideERB = :register;
    erb :layout;
end

# POST STUFF
# SIGNUP
post '/register' do 

    @user = User.create(fname: params["fname"], lname: params["lname"], email: params["email"], bio: params["bio"], password: params["password"], dob: params["dob"], lastOn: params["lastOn"], admin: false, picture: params["picture"]);
    @sideERB = :register
    erb :layout
end

# LOGIN
post '/signin' do 
    
    @myuserid = params["email"];
    @sideERB  = :profile;
    erb :layout;

    @user = User.where(username: params[:username]).first
    if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "You've been signed in successfully."
    else
        flash[:alert] = "There was a problem signing you in."
    end
    redirect "/"
end

get '/posts' do
    @mainERB = :posts_test
    erb :layout
end

post '/posts' do
    @mainERB = :posts_test
end

# GET STUFF
get '/' do
	erb :layout; #, :layout => :profile
end

get '/:name' do

    case params[:name]
    when "home"
        @sideERB = :error404;
        
    when "login"
        @sideERB = :error404;
    
    when "register"
        @sideERB = :register;
        
    when "logout"
        @sideERB = :error404;
        
    else
        @sideERB = :error404;
        
    end
    
    erb :layout;
end