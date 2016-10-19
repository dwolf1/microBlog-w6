# GET STUFF
get '/' do
	erb :layout; #, :layout => :profile
end

get('/entrance'){ File.read(File.join('public', 'html/entrance.html')) }

get('/profile'){ File.read(File.join('public', 'html/profile.html')) }


get '/:name' do
    
    case params[:name]
    when "home"
        @sideERB = :error404;
        
    when "login"
        @sideERB = :error404;
    
    when "register"
        @sideERB = :error404;
        
    when "logout"
        @sideERB = :error404;
        
    else
        @sideERB = :error404;
        
    end
    
    erb :layout;
end