<<<<<<< HEAD
=======
require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:userdb.sqlite3"

get '/' do

end

get '/:name' do

    case params[:name]
    when "home"
        erb :home;
    when "cart"
        erb :cart;
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
>>>>>>> master
