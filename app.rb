require "sinatra"
require "sinatra/activerecord"
require 'sinatra/contrib'
require 'json'
require "sinatra/flash"
require "./models"
require "./directory"

enable :sessions
set :database, "sqlite3:userdb.sqlite3"

before do 
	@users = User.all
	@posts = Post.all
end

# POST STUFF
# SIGNUP
post '/register' do 
    @user = User.create(fname: params["fname"], lname: params["lname"], email: params["email"], bio: params["bio"], password: params["password"], dob: params["dob"], lastOn: params["lastOn"], admin: false, picture: params["picture"]);
end

post '/edit' do
    
	if params[:email].present?
    	User.update(session[:id], email: params[:email]);
    end
    
    if params[:fname].present?
    	User.update(session[:id], fname: params["fname"]);
    end
    
    if params[:lname].present?
    	User.update(session[:id], lname: params["lname"]);
    end
    
    if params[:bio].present?
    	User.update(session[:id], bio: params["bio"]);
    end
    
    if params[:password].present?
    	User.update(session[:id], password: params["password"]);
    end
    
    if params[:picture].present?
     	User.update(session[:id], picture: "default_02.png");
    end

end

post '/posts' do
	@post = Post.create(username: session[:id], post: params["posting"], timestamp: Time.now.to_s(:military))
end

# LOGIN
post '/signin' do
	if User.exists?(password: params[:password]) && User.exists?(email: params[:email])
		# pass and username exit
		@user = User.find_by(email: params["email"], password: params["password"])
		session[:id] = @user.id;
		return "good";
	else
		# Could not find username or password
		return nil;
	end
end

post '/getuserinfo' do
    User.find(session[:id]).to_json
end

post '/finduser' do
    User.find(params[:id]).to_json
end

post '/getposts' do
   Post.all.to_json
end

post "/uploadimg" do 
  tempfile = params['file'][:tempfile]
  filename = params['file'][:filename]
  File.copy(tempfile.path, "./files/#{filename}")
  redirect '/'
end


