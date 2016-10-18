require "sinatra"
require "sinatra/activerecord"
require 'sinatra/contrib'
require "./models"
set :database, "sqlite3:userdb.sqlite3"

before do 
    @sideERB = :front;
end

get '/' do
	erb :layout; #, :layout => :profile
end

get '/:name' do

    case params[:name]
    when "home"
        erb :home;
    when "logout"
        session.clear
        erb :logout;
    else
        erb :Error404;
    end

end

post '/signup' do 
    # Signup some how
end

post '/login' do 
    # Login some how

end