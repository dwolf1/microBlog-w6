# GET STUFF
get '/' do
	erb :error404; #, :layout => :profile
end

get('/entrance'){ File.read(File.join('public', 'html/entrance.html')) }

get('/profile'){ File.read(File.join('public', 'html/profile.html')) }

get('/account'){ File.read(File.join('public', 'html/account.html')) }


get '/:name' do
    erb :error404
    
    case params[:name]
    when "home"
        erb :error404;
        
    when "login"
        erb :error404;        
    else
        erb :error404;
    end
    
end