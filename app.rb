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
	@users = User.all
	@posts = Post.all
    @myuserid = "ThebestNameoutthere";
end

# POST STUFF
# SIGNUP
get '/register' do 

    @user = User.create(fname: params["fname"], lname: params["lname"], email: params["email"], bio: params["bio"], password: params["password"], dob: params["dob"], lastOn: params["lastOn"], admin: false, picture: params["picture"]);
end

# LOGIN
post '/signin' do 
    
    @a = params[:email]
    
#    @user = User.where(username: params[:username]).first
#    if @user && @user.password == params[:password]
#        session[:user_id] = @user.id
#        flash[:notice] = "You've been signed in successfully."
#    else
#        flash[:alert] = "There was a problem signing you in."
#    end
    
end

get '/posts' do
    @mainERB = :posts_test
    erb :layout
end

post '/posts' do
    @mainERB = :posts_test
end