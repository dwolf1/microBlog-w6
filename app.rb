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
    @current_user = "This is the current user";
	@users = User.all
	@posts = Post.all
end

# POST STUFF
# SIGNUP
post '/register' do 

    @user = User.create(fname: params["fname"], lname: params["lname"], email: params["email"], bio: params["bio"], password: params["password"], dob: params["dob"], lastOn: params["lastOn"], admin: false, picture: params["picture"]);
end

# LOGIN
post '/signin' do 
    @rtnval = false;
    
    if User.exists?(password: params["password"]) && User.exists?(email: params["email"])
		# pass and username exit
		@user = User.find_by(email: params[:email], password: params[:password])
		session[:id] = @user.id;
        @current_user = "This is the";
        return "good";
	else
		# Could not find username or password
        return nil;
	end   

end

get '/posts' do
    @mainERB = :posts_test
    erb :layout
end

post '/posts' do
    @mainERB = :posts_test
end