require "sinatra"
require "sinatra/activerecord"
require 'sinatra/contrib'
require "./models"

set :database, "sqlite3:userdb.sqlite3"

before do 
    @mainERB = :postfeed;
    @sideERB = :front;
    
    @myuserid = "ThebestNameoutthere";
end



# POST STUFF
# SIGNUP
post '/register' do 
    
    # Signup some how
    @user = User.new(fname: params["fname"], lname: params["lname"], email: params["email"], bio: params["bio"], password: params["password"], dob: params["dob"], lastOn: params["lastOn"], admin: false, picture: params["picture"]);
    @user.save;
    
end

# LOGIN
post '/signin' do 
    # Login some how
    
    @myuserid = params["email"];
    
    @sideERB  = :profile;
    erb :layout;
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