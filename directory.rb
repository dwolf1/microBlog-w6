# GET STUFF
get '/' do
	erb :error404; #, :layout => :profile
end

get '/display' do
    erb :display_tables; #, :layout => :profile
end

get '/feed' do
    erb :feed; #, :layout => :profile
end

get('/entrance'){ File.read(File.join('public', 'html/entrance.html')) }

get('/register'){ File.read(File.join('public', 'html/register.html')) }

get('/profile'){ File.read(File.join('public', 'html/profile.html')) }

get('/account'){ File.read(File.join('public', 'html/account.html')) }

get('/posts'){ File.read(File.join('public', 'html/posts.html')) }

get('/logout'){
    session.clear
    erb :feed
}

post('/delete'){ 
    User.find(session[:id]).destroy
    File.read(File.join('public', 'html/delete.html')) 
}

post('/delete_all'){
    User.delete_all()
}


#get '/:name' do
#    erb :error404
#    
#    case params[:name]
#    when "home"
#        erb :error404;
#        
#    when "login"
#        erb :error404;        
#    else
#        erb :error404;
#    end
#    
#end